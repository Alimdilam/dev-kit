# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

MY_P="uuid-${PV}"

PHP_EXT_NAME="uuid"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
PHP_EXT_S="${WORKDIR}/${MY_P}/php"
PHP_EXT_OPTIONAL_USE="php"
PHP_EXT_SKIP_PATCHES="yes"
USE_PHP="php5-6 php7-0 php7-1"

GENTOO_DEPEND_ON_PERL="no"

inherit perl-module php-ext-source-r3

DESCRIPTION="An ISO-C:1999 API with CLI for generating DCE, ISO/IEC and RFC compliant UUID"
HOMEPAGE="http://www.ossp.org/pkg/lib/uuid/"
SRC_URI="ftp://ftp.ossp.org/pkg/lib/uuid/${MY_P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 ~s390 ~sh sparc x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE="+cxx perl php static-libs"

DEPEND="perl? ( dev-lang/perl:= )"
RDEPEND="${DEPEND} php? ( !dev-php/pecl-uuid )"

S="${WORKDIR}/${MY_P}"

src_prepare() {

	eapply \
		"${FILESDIR}/${P}-gentoo-r1.patch" \
		"${FILESDIR}/${P}-gentoo-perl.patch" \
		"${FILESDIR}/${P}-hwaddr.patch" \
		"${FILESDIR}/${P}-manfix.patch" \
		"${FILESDIR}/${P}-uuid-preserve-m-option-status-in-v-option-handling.patch" \
		"${FILESDIR}/${P}-fix-whatis-entries.patch" \
		"${FILESDIR}/${P}-fix-data-uuid-from-string.patch"

	eapply_user
	if use php; then
		pushd "${PHP_EXT_S}" > /dev/null || die
		eapply -p2 \
			"${FILESDIR}/${P}-gentoo-php.patch" \
			"${FILESDIR}/uuid-${PV}-php54.patch" \
			"${FILESDIR}/${P}-php70.patch"
		popd > /dev/null || die
		php-ext-source-r3_src_prepare

		#Remove call by reference which is error
		sed -i -e 's/\&\$/\$/' -e '/?>/d' "${S}/php/uuid.php5" || die
	fi
}

src_configure() {
	# Notes:
	# * collides with e2fstools libs and includes if not moved around
	# * pgsql-bindings need PostgreSQL-sources and are included since PostgreSQL 8.3
	econf \
		--includedir="${EPREFIX}"/usr/include/ossp \
		--with-dce \
		--without-pgsql \
		--without-perl \
		--without-php \
		$(use_with cxx) \
		$(use_enable static-libs static)

	if use php; then
		php-ext-source-r3_src_configure
	fi
}

src_compile() {
	default

	if use perl; then
		cd perl
		# configure needs the ossp-uuid.la generated by `make` in $S
		perl-module_src_configure
		perl-module_src_compile
	fi

	if use php; then
		php-ext-source-r3_src_compile
	fi
}

src_install() {
	local DOCS=( AUTHORS BINDINGS ChangeLog HISTORY NEWS OVERVIEW PORTING README SEEALSO THANKS TODO USERS )
	default
	unset DOCS #unset so that other eclasses don't try to install them and possibly fail
	if use perl ; then
		cd perl
		perl-module_src_install
	fi

	if use php ; then
		php-ext-source-r3_src_install
		insinto /usr/share/php
		cd "${S}/php" || die
		newins uuid.php5 uuid.php
	fi

	use static-libs || rm -rf "${ED}"/usr/lib*/*.la

	mv "${ED}/usr/$(get_libdir)/pkgconfig"/{,ossp-}uuid.pc
	mv "${ED}/usr/share/man/man3"/uuid.3{,ossp}
	mv "${ED}/usr/share/man/man3"/uuid++.3{,ossp}
}

src_test() {
	export LD_LIBRARY_PATH="${S}/.libs" # required for the perl-bindings to load the (correct) library
	default

	use perl && emake -C perl test
}

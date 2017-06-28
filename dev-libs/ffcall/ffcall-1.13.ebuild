# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils flag-o-matic toolchain-funcs

MY_PV="libffcall-${PV}"

DESCRIPTION="foreign function call libraries"
HOMEPAGE="https://www.gnu.org/software/libffcall/"
SRC_URI="http://ftp.gnu.org/gnu/libffcall/${MY_PV}.tar.gz"

# "Ffcall is under GNU GPL. As a special exception, if used in GNUstep
# or in derivate works of GNUstep, the included parts of ffcall are
# under GNU LGPL." -ffcall author
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~x86-solaris"
IUSE=""

S=${WORKDIR}/${MY_PV}

DEPEND=""
RDEPEND=""

src_prepare() {
	epatch "${FILESDIR}"/${PN}-make-jN.patch

	# The build system is a strange mix of autogenerated
	# files and manual tweaks on top. Uses $CFLAGS / $LDFLAGS randomly.
	# We are adding them consistently here and a bit over the top:
	# bugs: #334581

	for mfi in {,*/,*/*/,}Makefile.in
	do
		elog "Patching '${mfi}'"
		# usually uses only assembler here, but -march=
		# and -Wa, are a must to pass here.
		sed -e 's/$(CC) /&$(CFLAGS) /g' \
			-i "${mfi}" || die

		# usually uses '$(CC) ... -o something' for linking
		sed -e 's/\($(CC) .* \)-o /\1 $(LDFLAGS) -o /g' \
			-i "${mfi}" || die
	done
	eapply_user
}

src_configure() {
	append-flags -fPIC
	append-flags $(test-flags-CC -Wa,--noexecstack) #253963

	# Doc goes in datadir
	econf \
		--datadir="${EPREFIX}"/usr/share/doc/${PF} \
		--enable-shared \
		--disable-static
}

src_compile() {
	# Because CHOST is set to (for example)
	# alphaev67-unknown-linux-gnu, CPU gets set to alphaev67 which
	# doesn't work in the Makefile (29 Jan 2004 agriffis)
	local cpu_setting
	[[ "${ARCH}" == "alpha" ]] && cpu_setting='CPU=alpha'

	emake ${cpu_setting}
}

src_install() {
	dodoc NEWS README
	dodir /usr/share/man
	default
	prune_libtool_files
}

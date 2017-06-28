# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGIT_REPO_URI="https://github.com/tdf/libcmis.git"
[[ ${PV} == 9999 ]] && SCM_ECLASS="git-r3"
inherit alternatives autotools ${SCM_ECLASS}
unset SCM_ECLASS

DESCRIPTION="C++ client library for the CMIS interface"
HOMEPAGE="https://github.com/tdf/libcmis"
if [[ ${PV} = *_pre* ]]; then
	snapshot=da8c3fdc281a0cb3753a6bb9eaa63ac6385e2963
	SRC_URI="https://github.com/tdf/${PN}/archive/${snapshot}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${PN}-${snapshot}"
	unset snapshot
elif [[ ${PV} != 9999 ]] ; then
	SRC_URI="https://github.com/tdf/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="|| ( GPL-2 LGPL-2 MPL-1.1 )"
SLOT="0.5"

# Don't move KEYWORDS on the previous line or ekeyword won't work # 399061
[[ ${PV} == 9999 ]] || \
KEYWORDS="amd64 ~arm x86 ~amd64-linux ~x86-linux"

IUSE="static-libs man test"

COMMON_DEPEND="
	dev-libs/boost:=
	dev-libs/libxml2
	net-misc/curl
"
DEPEND="${COMMON_DEPEND}
	virtual/pkgconfig
	man? (
		app-text/docbook2X
		dev-libs/libxslt
	)
	test? (
		dev-util/cppcheck
		dev-util/cppunit
	)
"
RDEPEND="${COMMON_DEPEND}
	!<dev-cpp/libcmis-0.5.0
"

src_prepare() {
	default
	[[ ${PV} = *_pre* || ${PV} = 9999 ]] && eautoreconf
}

src_configure() {
	econf \
		--program-suffix=-${SLOT} \
		--disable-werror \
		$(use_with man) \
		$(use_enable static-libs static) \
		$(use_enable test tests) \
		--enable-client
}

src_install() {
	default
	find "${D}" -name '*.la' -delete || die
}

pkg_postinst() {
	alternatives_auto_makesym /usr/bin/cmis-client "/usr/bin/cmis-client-[0-9].[0-9]"
}

pkg_postrm() {
	alternatives_auto_makesym /usr/bin/cmis-client "/usr/bin/cmis-client-[0-9].[0-9]"
}

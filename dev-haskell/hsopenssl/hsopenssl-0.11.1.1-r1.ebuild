# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# ebuild generated by hackport 0.4.4.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

MY_PN="HsOpenSSL"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Partial OpenSSL binding for Haskell"
HOMEPAGE="https://github.com/phonohawk/HsOpenSSL"
SRC_URI="mirror://hackage/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="public-domain"
SLOT="0/${PV}"
KEYWORDS="amd64 x86"
IUSE="+fast-bignum libressl"

RESTRICT=test # whoops, not good

RDEPEND=">=dev-haskell/network-2.1:=[profile?] <dev-haskell/network-2.7:=[profile?]
	>=dev-haskell/old-locale-1.0:=[profile?] <dev-haskell/old-locale-1.1:=[profile?]
	>=dev-lang/ghc-7.4.1:=
	!libressl? ( dev-libs/openssl:0= )
	libressl? ( dev-libs/libressl:= )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
	test? ( >=dev-haskell/hunit-1.0 <dev-haskell/hunit-1.3
		>=dev-haskell/test-framework-0.8 <dev-haskell/test-framework-0.9
		>=dev-haskell/test-framework-hunit-0.3 <dev-haskell/test-framework-hunit-0.4 )
"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	cabal_chdeps \
		'time       >= 1.1.1 && < 1.6' 'time       >= 1.1.1'
}

src_configure() {
	local fbn_flag=$(cabal_flag fast-bignum fast-bignum)

	# not ported to integer-gmp-1.0:
	#  https://github.com/phonohawk/HsOpenSSL/issues/36
	[[ $(ghc-version) == 7.10.* ]] && fbn_flag=-f-fast-bignum

	haskell-cabal_src_configure \
		${fbn_flag}
}

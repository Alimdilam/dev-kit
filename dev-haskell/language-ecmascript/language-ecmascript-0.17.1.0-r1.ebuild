# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

# ebuild generated by hackport 0.4.7.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="JavaScript parser and pretty-printer library"
HOMEPAGE="https://github.com/jswebtools/language-ecmascript"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/data-default-class-0.0.1:=[profile?]
	>=dev-haskell/diff-0.3:=[profile?] <dev-haskell/diff-0.4:=[profile?]
	>=dev-haskell/mtl-1:=[profile?] <dev-haskell/mtl-3:=[profile?]
	>dev-haskell/parsec-3:=[profile?] <dev-haskell/parsec-3.2.0:=[profile?]
	>=dev-haskell/quickcheck-2.5:2=[profile?] <dev-haskell/quickcheck-3:2=[profile?]
	>=dev-haskell/testing-feat-0.4.0.2:=[profile?] <dev-haskell/testing-feat-0.5:=[profile?]
	>=dev-haskell/uniplate-1.6:=[profile?] <dev-haskell/uniplate-1.7:=[profile?]
	>=dev-haskell/wl-pprint-1.2:=[profile?] <dev-haskell/wl-pprint-2:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
	test? ( >=dev-haskell/hunit-1.2 <dev-haskell/hunit-1.4
		>=dev-haskell/test-framework-0.8 <dev-haskell/test-framework-0.9
		>=dev-haskell/test-framework-hunit-0.3.0 <dev-haskell/test-framework-hunit-0.4
		>=dev-haskell/test-framework-quickcheck2-0.3.0.1 <dev-haskell/test-framework-quickcheck2-0.4 )
"

src_prepare() {
	cabal_chdeps \
		'data-default-class >= 0.0.1 && < 0.1' 'data-default-class >= 0.0.1'
}

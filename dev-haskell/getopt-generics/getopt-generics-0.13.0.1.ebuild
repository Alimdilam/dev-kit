# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Create command line interfaces with ease"
HOMEPAGE="https://github.com/soenkehahn/getopt-generics#readme"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/base-compat-0.8:=[profile?]
	dev-haskell/base-orphans:=[profile?]
	>=dev-haskell/generics-sop-0.1:=[profile?] <dev-haskell/generics-sop-0.4:=[profile?]
	dev-haskell/tagged:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
	test? ( >=dev-haskell/hspec-2.1.8
		dev-haskell/quickcheck
		dev-haskell/safe
		dev-haskell/silently )
"

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.9999

CABAL_FEATURES="bin lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="An alternative format for Haskell packages"
HOMEPAGE="https://github.com/sol/hpack#readme"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/aeson-0.8:=[profile?]
	>=dev-haskell/base-compat-0.8:=[profile?]
	dev-haskell/glob:=[profile?]
	dev-haskell/text:=[profile?]
	dev-haskell/unordered-containers:=[profile?]
	dev-haskell/yaml:=[profile?]
	>=dev-lang/ghc-7.8.2:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18.1.3
	test? ( >=dev-haskell/aeson-0.10
		dev-haskell/aeson-qq
		>=dev-haskell/hspec-2 <dev-haskell/hspec-3
		dev-haskell/interpolate
		>=dev-haskell/mockery-0.3
		dev-haskell/quickcheck
		dev-haskell/temporary )
"

PATCHES=("${FILESDIR}"/${P}-aeson-1.patch)

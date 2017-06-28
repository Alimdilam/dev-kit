# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.1.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

MY_PN="ReadArgs"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Simple command line argument parsing"
HOMEPAGE="https://github.com/rampion/ReadArgs"
SRC_URI="mirror://hackage/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/system-filepath-0.4.7:=[profile?] <dev-haskell/system-filepath-0.5:=[profile?]
	>=dev-haskell/text-0.11.1.13:=[profile?] <dev-haskell/text-12:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
	test? ( >=dev-haskell/hspec-1.3 <dev-haskell/hspec-3 )
"

S="${WORKDIR}/${MY_P}"

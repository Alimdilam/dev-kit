# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.1

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="http-client backend using the connection package and tls library"
HOMEPAGE="https://github.com/snoyberg/http-client"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT=test # needs network access

RDEPEND="dev-haskell/case-insensitive:=[profile?]
	>=dev-haskell/connection-0.2.2:=[profile?]
	dev-haskell/cryptonite:=[profile?]
	dev-haskell/data-default-class:=[profile?]
	dev-haskell/exceptions:=[profile?]
	>=dev-haskell/http-client-0.5.0:=[profile?]
	dev-haskell/http-types:=[profile?]
	dev-haskell/memory:=[profile?]
	dev-haskell/network:=[profile?]
	>=dev-haskell/tls-1.2:=[profile?]
	>=dev-lang/ghc-7.8.2:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18.1.3
	test? ( dev-haskell/hspec )
"

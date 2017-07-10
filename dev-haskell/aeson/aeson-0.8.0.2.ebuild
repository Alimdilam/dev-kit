# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

# ebuild generated by hackport 0.4.4.9999
#hackport: flags: -developer

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Fast JSON parsing and encoding"
HOMEPAGE="https://github.com/bos/aeson"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/attoparsec-0.11.3.4:=[profile?]
	>=dev-haskell/dlist-0.2:=[profile?]
	>=dev-haskell/hashable-1.1.2.0:=[profile?]
	dev-haskell/mtl:=[profile?]
	>=dev-haskell/scientific-0.3.1:=[bytestring-builder,profile?] <dev-haskell/scientific-0.4:=[bytestring-builder,profile?]
	dev-haskell/syb:=[profile?]
	>=dev-haskell/text-1.1.1.0:=[profile?]
	>=dev-haskell/unordered-containers-0.2.3.0:=[profile?]
	>=dev-haskell/vector-0.7.1:=[profile?]
	>=dev-lang/ghc-7.8.2:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18.1.3
	test? ( dev-haskell/hunit
		dev-haskell/quickcheck
		dev-haskell/test-framework
		dev-haskell/test-framework-hunit
		dev-haskell/test-framework-quickcheck2 )
"

src_configure() {
	haskell-cabal_src_configure \
		--flag=-developer
}

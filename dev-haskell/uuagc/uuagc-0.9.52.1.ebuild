# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

# ebuild generated by hackport 0.4.4.9999

CABAL_FEATURES="bin lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Attribute Grammar System of Universiteit Utrecht"
HOMEPAGE="http://www.cs.uu.nl/wiki/HUT/WebHome"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="bootstrap_external with-loag"

RDEPEND=">=dev-haskell/haskell-src-exts-1.11.1:=[profile?]
	>=dev-haskell/mtl-1.1.1.1:=[profile?]
	>=dev-haskell/uuagc-cabal-1.0.2.0:=[profile?]
	>=dev-haskell/uulib-0.9.14:=[profile?]
	>=dev-lang/ghc-7.4.1:=
	with-loag? ( dev-haskell/minisat:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag bootstrap_external bootstrap_external) \
		$(cabal_flag with-loag with-loag)
}

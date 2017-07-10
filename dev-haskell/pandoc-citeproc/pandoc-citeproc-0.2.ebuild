# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

# ebuild generated by hackport 0.3.5.9999

CABAL_FEATURES="bin lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Supports using pandoc with citeproc"
HOMEPAGE="http://hackage.haskell.org/package/pandoc-citeproc"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="+bibutils embed_data_files +hexpat +network +small_base unicode_collation"
RESTRICT=test # missing files: locales-en-US.xml: openBinaryFile

RDEPEND=">=app-text/pandoc-1.12.1:=[profile?]
	dev-haskell/aeson:=[profile?]
	dev-haskell/aeson-pretty:=[profile?]
	dev-haskell/attoparsec:=[profile?]
	dev-haskell/mtl:=[profile?]
	>=dev-haskell/pandoc-types-1.12.3:=[profile?]
	dev-haskell/parsec:=[profile?]
	dev-haskell/split:=[profile?]
	dev-haskell/syb:=[profile?]
	dev-haskell/tagsoup:=[profile?]
	>=dev-haskell/temporary-1.1:=[profile?]
	>=dev-haskell/texmath-0.6.4:=[profile?]
	dev-haskell/text:=[profile?]
	>=dev-haskell/vector-0.10:=[profile?] <dev-haskell/vector-0.11:=[profile?]
	>=dev-haskell/yaml-0.8:=[profile?]
	>=dev-lang/ghc-7.0.1:=
	bibutils? ( >=dev-haskell/hs-bibutils-0.3:=[profile?] )
	hexpat? ( >=dev-haskell/hexpat-0.20.2:=[profile?] )
	!hexpat? ( dev-haskell/xml:=[profile?] )
	network? ( >=dev-haskell/http-4000.0.9:=[profile?]
			>=dev-haskell/network-2:=[profile?] )
	unicode_collation? ( dev-haskell/text-icu:=[profile?] )
	!unicode_collation? ( dev-haskell/rfc5051:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.12
"

src_configure() {
	# workaround bug on ghc-7.6.3:
	# > [13 of 24] Compiling Text.CSL.Input.Bibtex ...
	# > stack overflow: use +RTS -K<size> to increase it
	replace-hcflags -O[2-9] -O1

	haskell-cabal_src_configure \
		$(cabal_flag bibutils bibutils) \
		$(cabal_flag embed_data_files embed_data_files) \
		$(cabal_flag hexpat hexpat) \
		$(cabal_flag network network) \
		$(cabal_flag small_base small_base) \
		$(cabal_flag unicode_collation unicode_collation)
}

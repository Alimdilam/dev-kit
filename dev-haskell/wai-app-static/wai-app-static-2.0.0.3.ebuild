# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

# ebuild generated by hackport 0.3.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="WAI application for static serving"
HOMEPAGE="http://www.yesodweb.com/book/web-application-interface"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="print"

RDEPEND=">=dev-haskell/base64-bytestring-0.1:=[profile?]
	>=dev-haskell/blaze-builder-0.2.1.4:=[profile?]
	>=dev-haskell/blaze-html-0.5:=[profile?]
	>=dev-haskell/blaze-markup-0.5.1:=[profile?]
	>=dev-haskell/cereal-0.3.5:=[profile?]
	>=dev-haskell/crypto-api-0.12.2:=[profile?]
	>=dev-haskell/crypto-conduit-0.4:=[profile?]
	>=dev-haskell/cryptohash-cryptoapi-0.1.0:=[profile?]
	>=dev-haskell/file-embed-0.0.3.1:=[profile?]
	dev-haskell/http-date:=[profile?]
	>=dev-haskell/http-types-0.7:=[profile?]
	>=dev-haskell/mime-types-0.1:=[profile?] <dev-haskell/mime-types-0.2:=[profile?]
	>=dev-haskell/system-fileio-0.3:=[profile?]
	>=dev-haskell/system-filepath-0.4:=[profile?]
	>=dev-haskell/text-0.7:=[profile?]
	>=dev-haskell/transformers-0.2.2:=[profile?]
	>=dev-haskell/unix-compat-0.2:=[profile?]
	>=dev-haskell/unordered-containers-0.2:=[profile?]
	>=dev-haskell/wai-2.0:=[profile?] <dev-haskell/wai-2.2:=[profile?]
	>=dev-haskell/zlib-0.5:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
	test? ( >=dev-haskell/hspec-1.3
		dev-haskell/network
		dev-haskell/wai-test )
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag print print)
}

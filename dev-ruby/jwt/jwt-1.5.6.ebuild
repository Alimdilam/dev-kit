# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="A Ruby implementation of JSON Web Token draft 06"
HOMEPAGE="https://github.com/jwt/ruby-jwt"
SRC_URI="https://github.com/jwt/ruby-jwt/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc64"
IUSE=""

RUBY_S="ruby-jwt-${PV}"

all_ruby_prepare() {
	sed -i -e "/simplecov/ s:^:#:" \
		-e '/^SimpleCov.configure/,/^end/ s:^:#:' \
		-e '/codeclimate/I s:^:#:' \
		spec/spec_helper.rb || die
}

# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit flag-o-matic eutils git-r3

DESCRIPTION="Like SQLite but encrypted"
EGIT_REPO_URI="https://github.com/${PN}/${PN}.git"
EGIT_COMMIT="v${PV}"
HOMEPAGE="http://sqlcipher.net/"
KEYWORDS="~amd64 ~x86"
LICENSE=ZETETIC
SLOT=0

RDEPEND="dev-libs/openssl"
DEPEND="${RDEPEND}
	dev-lang/tcl"

src_configure()
{
	append-cflags -DSQLITE_HAS_CODEC -DSQLITE_TEMP_STORE=2
	append-ldflags -lcrypto

	econf --enable-tempstore=yes
}

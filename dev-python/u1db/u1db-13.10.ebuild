# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_4} )

inherit distutils-r1 versionator eutils

MY_PV=$(replace_version_separator 1 '-')

DESCRIPTION="U1DB is a database API for synchronised databases of JSON documents"
HOMEPAGE="https://launchpad.net/u1db"
SRC_URI="https://launchpad.net/${PN}/stable-${MY_PV}/${PV}/+download/u1db-${PV}.tar.bz2"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

DEPEND="dev-python/cython
	${PYTHON_DEPS}"

src_install() {
	# Delete some files that are only useful on Ubuntu
	rm -rf "${ED}"etc/apport "${ED}"usr/share/apport

	distutils-r1_src_install
}

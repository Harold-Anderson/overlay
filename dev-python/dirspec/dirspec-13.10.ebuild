# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 versionator eutils

MY_PV=$(replace_version_separator 1 '-')

DESCRIPTION="Support for handling directories per XDG Base Directory and User Folders spec"
HOMEPAGE="https://launchpad.net/u1db"
SRC_URI="https://launchpad.net/${PN}/stable-${MY_PV}/${PV}/+download/${PN}-${PV}.tar.gz"

LICENSE=LGPL-3
SLOT=0

KEYWORDS="~amd64 ~x86"

DEPEND="${PYTHON_DEPS}"

src_install() {
	# Delete some files that are only useful on Ubuntu
	rm -rf "${ED}"etc/apport "${ED}"usr/share/apport

	distutils-r1_src_install
}

# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Fork of python-gnupg that fixes potential remote execution bug."
HOMEPAGE="http://pypi.python.org/pypi/enum/"
IUSE=""
KEYWORDS="~amd64 ~x86"
LICENSE="GPL-2"
RESTRICT=mirror
SLOT=0
SRC_URI="mirror://pypi/g/${PN}/${P}.tar.gz"

# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Fork of python-gnupg that fixes potential remote execution bug."
HOMEPAGE="http://pypi.python.org/pypi/gnupg/"
SRC_URI="mirror://pypi/g/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT=0

KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT=mirror

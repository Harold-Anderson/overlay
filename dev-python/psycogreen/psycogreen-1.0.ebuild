# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Enables psycopg2 to work with coroutine libraries."
HOMEPAGE="https://bitbucket.org/dvarrazzo/psycogreen"
SRC_URI="mirror://pypi/p/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

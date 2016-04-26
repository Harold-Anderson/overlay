# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Robust enumerated type support in Python."
HOMEPAGE="http://pypi.python.org/pypi/enum/"
SRC_URI="mirror://pypi/e/${PN}/${P}.tar.gz"

LICENSE=GPL-2
SLOT=0

KEYWORDS="~amd64 ~x86"

IUSE=""
RESTRICT="mirror"

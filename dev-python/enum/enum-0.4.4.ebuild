# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

RESTRICT="mirror"
DESCRIPTION="Robust enumerated type support in Python."
HOMEPAGE="http://pypi.python.org/pypi/enum/"
SRC_URI="mirror://pypi/e/${PN}/${P}.tar.gz"

IUSE=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
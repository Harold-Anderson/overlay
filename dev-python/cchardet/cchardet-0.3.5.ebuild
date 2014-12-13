# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="3000 times faster than chardet"
HOMEPAGE="https://github.com/PyYoshi/cChardet"
IUSE=""
KEYWORDS="~amd64 ~x86"
LICENSE="MIT"
SLOT=0
SRC_URI="mirror://pypi/c/cchardet/cchardet-0.3.5.tar.gz"

DEPEND="dev-python/cython[${PYTHON_USEDEP}]
	${PYTHON_DEPS}"

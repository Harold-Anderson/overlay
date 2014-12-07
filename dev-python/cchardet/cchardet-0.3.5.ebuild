# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="3000 times faster than chardet"
HOMEPAGE="https://github.com/PyYoshi/cChardet"
SRC_URI="mirror://pypi/c/cchardet/cchardet-0.3.5.tar.gz"
IUSE=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-python/cython[${PYTHON_USEDEP}]
	${PYTHON_DEPS}"

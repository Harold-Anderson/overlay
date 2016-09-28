# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Convert Japanese characters."
HOMEPAGE="http://github.com/taichino/jcconv"
SRC_URI="https://pypi.python.org/packages/dd/5b/55d6dd385e8584c6750864ddec8d5ff82a295b37ac68344febc9e923bf99/${PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

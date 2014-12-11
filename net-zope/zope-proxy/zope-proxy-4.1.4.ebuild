# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Generic Transparent Proxies"
HOMEPAGE="https://pypi.python.org/pypi/${MY_PN}"

IUSE="doc"
KEYWORDS="~x86 ~amd64"
LICENSE="ZPL"

MY_PN="zope.proxy"
MY_P="${MY_PN}-${PV}"

SLOT="0"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

RDEPEND="net-zope/zope-interface[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/repoze-sphinx-autointerface[${PYTHON_USEDEP}]
	      dev-python/sphinx[${PYTHON_USEDEP}] )"

DOCS=(CHANGES.rst README.rst)

S=${WORKDIR}/${MY_P}

python_compile() {
	if ! python_is_python3; then
		local CFLAGS="${CFLAGS} -fno-strict-aliasing"
		export CFLAGS
	fi
	distutils-r1_python_compile
}

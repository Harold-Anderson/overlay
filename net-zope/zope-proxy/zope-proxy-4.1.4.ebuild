# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python{2_6,2_7,3_3,3_4} )

inherit distutils-r1 versionator

MY_PN="zope.proxy"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Generic Transparent Proxies"
HOMEPAGE="https://pypi.python.org/pypi/${MY_PN}"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="ZPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

RDEPEND="net-zope/zope-interface"
DEPEND="${RDEPEND}
	dev-python/setuptools
	doc? ( dev-python/repoze-sphinx-autointerface  )
	doc? ( dev-python/sphinx )"

PYTHON_CFLAGS=("2.* + -fno-strict-aliasing")

DISTUTILS_GLOBAL_OPTIONS=("*-jython --without-Cwrapper")
DOCS="CHANGES.rst README.rst"

S="${WORKDIR}/${MY_P}"
# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="validation support for WSGI 1.0.1 (PEP 3333)"
HOMEPAGE="http://cheeseshop.python.org/pypi/wsgiref"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${PN}-${PV}.zip"

LICENSE=BSD
SLOT=0
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
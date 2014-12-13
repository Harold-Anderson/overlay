# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Thread implementation that executes a repetitive task without the need to start up a new thread"
HOMEPAGE="https://github.com/tkuhlman/taskthread"
IUSE=""
KEYWORDS="~amd64 ~x86"
LICENSE=Apache-2.0
SLOT=0
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${PN}-${PV}.tar.gz"

RDEPEND=""
DEPEND="${RDEPEND}"

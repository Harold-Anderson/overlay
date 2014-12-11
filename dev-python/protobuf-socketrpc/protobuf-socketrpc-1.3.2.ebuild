# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

MY_PN=protobuf.socketrpc
MY_P="${MY_PN}-${PV}"

DESCRIPTION="rpc services for Google's protocol buffer"
HOMEPAGE="http://code.google.com/p/protobuf-socket-rpc/"
IUSE=""
KEYWORDS="~amd64 ~x86"
LICENSE=MIT
SLOT=0
S="${WORKDIR}/${MY_P}"
SRC_URI="mirror://pypi/p/${MY_PN}/${MY_P}.tar.gz"

DEPEND="dev-libs/protobuf[python,${PYTHON_USEDEP}]
	${PYTHON_DEPS}"

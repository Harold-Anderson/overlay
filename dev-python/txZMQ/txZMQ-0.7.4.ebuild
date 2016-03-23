# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="txZMQ allow to integrate easily zeromq sockets into Twisted event loop (reactor)"
HOMEPAGE="https://github.com/smira/txZMQ"

SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos"

IUSE=""

PY2_USEDEP=$(python_gen_usedep python2_7)
RDEPEND="dev-python/pyzmq"
REQUIRED_USE=""

python_configure_all() {
	tc-export CC
}

python_prepare_all() {
	distutils-r1_python_prepare_all
}

python_compile() {
	python_is_python3 || local -x CFLAGS="${CFLAGS} -fno-strict-aliasing"
	${PYTHON} setup.py build 
	distutils-r1_python_compile
}


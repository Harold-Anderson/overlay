# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="PyZMQ is a lightweight and super-fast messaging library built on top of the ZeroMQ library"
HOMEPAGE="http://www.zeromq.org/bindings:python http://pypi.python.org/pypi/pyzmq"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos"

IUSE="bundled doc examples green test"

PY2_USEDEP=$(python_gen_usedep python2_7)
RDEPEND="!bundled? ( >=net-libs/zeromq-2.1.9 )
	dev-python/py[${PYTHON_USEDEP}]
	dev-python/cffi[${PYTHON_USEDEP}]
	green? ( dev-python/gevent[${PY2_USEDEP}] )"
DEPEND="test? (
		${RDEPEND}
		dev-python/nose[${PYTHON_USEDEP}]
		$(python_gen_cond_dep "dev-python/gevent[${PY2_USEDEP}]" python2_7)
	)
	bundled? (
		!net-libs/zeromq
		!dev-libs/libsodium
	)
	doc? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/numpydoc[${PYTHON_USEDEP}]
	)"

REQUIRED_USE="test? ( green )"

python_configure_all() {
	tc-export CC
}

python_prepare_all() {
	sed -i -e s':intersphinx_mapping:#&:' docs/source/conf.py || die
	distutils-r1_python_prepare_all
}

python_compile_all() {
	use doc && emake -C docs html
}

python_compile() {
	python_is_python3 || local -x CFLAGS="${CFLAGS} -fno-strict-aliasing"
	${PYTHON} setup.py build --zmq=bundled
	distutils-r1_python_compile_all
}

python_test() {
	if python_is_python3; then
		einfo "Skipping python3 due to lack of support by gevent"
	elif ! use green; then
		einfo "Skipping greenlet tests due to green USE flag being disabled"
	else
		nosetests -svw "${BUILD_DIR}/lib/"
	fi
}

python_install_all() {
	use examples && local EXAMPLES=( examples/. )
	use doc && local HTML_DOCS=( docs/build/html/. )
	${PYTHON} setup.py install --zmq=bundled
}

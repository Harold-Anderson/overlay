# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 python-r1

DESCRIPTION="DB-API 2.0 interface for SQLite 3.x"
HOMEPAGE="https://github.com/ghaering/pysqlite"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE=ZLIB
SLOT=0
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND=">=dev-db/sqlite-3.3.8:3"
RDEPEND=${DEPEND}

src_prepare() {
	distutils-r1_src_prepare

	# Enable support for loadable sqlite extensions.
	sed -e "/define=SQLITE_OMIT_LOAD_EXTENSION/d" -i setup.cfg || die "sed setup.cfg failed"

	# Fix encoding.
	sed -e "s/\(coding: \)ISO-8859-1/\1utf-8/" -i lib/{__init__.py,dbapi2.py} || die "sed lib/{__init__.py,dbapi2.py} failed"

	# Workaround to make tests work without installing them.
	sed -e "s/pysqlite2.test/test/" -i lib/test/__init__.py || die "sed lib/test/__init__.py failed"
}

python_compile() {
	if ! python_is_python3; then
		local CFLAGS="${CFLAGS} -fno-strict-aliasing"
		export CFLAGS
	fi
	distutils-r1_python_compile
}

src_test() {
	cd lib

	testing() {
		python_execute PYTHONPATH="$(ls -d ../build-${PYTHON_ABI}/lib.*)" "$(PYTHON)" -c "from test import test; import sys; sys.exit(test())"
	}
	python_execute_function testing
}

src_install() {
	distutils-r1_src_install

	rm -r "${ED}usr/pysqlite2-doc"

	delete_tests() {
		rm -r "${ED}$(python_get_sitedir)/pysqlite2/test"
	}
	python_execute_function -q delete_tests

	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins doc/includes/sqlite3/*
	fi
}
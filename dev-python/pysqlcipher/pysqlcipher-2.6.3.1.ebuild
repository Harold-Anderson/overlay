# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

# Only Python 2.
PYTHON_COMPAT=( python2_7 )

inherit versionator distutils-r1

MY_PV=$(replace_version_separator 3 '-')

DESCRIPTION="A fork of pysqlite.   An interface to SQLite 3.x with SQLCipher"
HOMEPAGE="https://leap.se https://github.com/leapcode/pysqlcipher/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${PN}-${MY_PV}.tar.gz"

LICENSE="CC-BY-SA-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=""
DEPEND="${RDEPEND}
	dev-db/sqlcipher" 

S="${WORKDIR}/${PN}-${MY_PV}"

python_prepare_all() {
	distutils-r1_python_prepare_all
}

python_compile_all() {
	"${PYTHON}" setup.py build_sqlcipher || die
}

python_install() {
	distutils-r1_python_install
}

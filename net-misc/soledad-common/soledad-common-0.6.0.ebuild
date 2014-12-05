# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_4} )

inherit eutils git-r3 distutils-r1

DESCRIPTION="Synchronizatin of locally encrypted data among devices"
HOMEPAGE="https://leap.se/en/docs/soledad"
EGIT_REPO_URI="https://github.com/leapcode/soledad.git"
EGIT_COMMIT="${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/simplejson[${PYTHON_USEDEP}]
	dev-python/u1db[${PYTHON_USEDEP}]
	dev-python/scrypt[${PYTHON_USEDEP}]
	dev-python/pycryptopp[${PYTHON_USEDEP}]
	dev-python/chardet[${PYTHON_USEDEP}]
	dev-python/oauth[${PYTHON_USEDEP}]
	dev-python/taskthread[${PYTHON_USEDEP}]
	dev-python/pysqlcipher[${PYTHON_USEDEP}]
	dev-python/couchdb-python[${PYTHON_USEDEP}]
	dev-python/configparser[${PYTHON_USEDEP}]
	dev-python/twisted-web[${PYTHON_USEDEP}]
	net-firewall/iptables[ipv6]"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${P}/common"
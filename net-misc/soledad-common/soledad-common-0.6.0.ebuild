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

RDEPEND="dev-python/simplejson
	dev-python/u1db
	dev-python/scrypt
	dev-python/pycryptopp
	dev-python/chardet
	dev-python/oauth
	dev-python/taskthread
	dev-python/pysqlcipher
	dev-python/couchdb-python
	dev-python/configparser
	dev-python/twisted-web
	net-firewall/iptables[ipv6]"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${P}/common"
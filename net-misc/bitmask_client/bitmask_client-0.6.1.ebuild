# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_4} )

inherit eutils git-r3 distutils-r1

DESCRIPTION="Desktop client for the LEAP Platform."
HOMEPAGE="https://leap.se/en/docs/client"
EGIT_REPO_URI="https://github.com/leapcode/${PN}.git"
EGIT_COMMIT="${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/requests
	virtual/python-argparse
	dev-python/srp
	dev-python/pyopenssl
	dev-python/python-dateutil
	dev-python/psutil
	dev-python/ipaddr
	dev-python/python-daemon
	dev-python/keyring
	dev-python/oauth
	dev-python/pyzmq
	>=net-misc/leap_mail-0.3.9
	>=net-misc/soledad-client-0.5.0
	>=net-misc/leap_pycommon-0.3.7
	>=net-misc/keymanager-0.3.8
	dev-python/twisted-web"

DEPEND="${RDEPEND}"
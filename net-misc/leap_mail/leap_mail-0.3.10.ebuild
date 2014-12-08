# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_4} )

inherit eutils git-r3 distutils-r1

DESCRIPTION="Mail services for the LEAP Client"
HOMEPAGE="https://leap.se"
EGIT_REPO_URI="https://github.com/leapcode/${PN}.git"
EGIT_COMMIT="${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="net-zope/zope-interface
	>=net-misc/soledad-client-0.4.5[${PYTHON_USEDEP}]
	>=net-misc/leap_pycommon-0.3.7[${PYTHON_USEDEP}]
	>=net-misc/keymanager-0.3.8[${PYTHON_USEDEP}]
	dev-python/enum34[${PYTHON_USEDEP}]
	dev-python/twisted-mail[${PYTHON_USEDEP}]"
	dev-python/twisted-web[${PYTHON_USEDEP}]"


DEPEND="${RDEPEND}"
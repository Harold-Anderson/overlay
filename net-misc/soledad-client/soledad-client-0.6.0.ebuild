# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit eutils git-r3 distutils-r1

DESCRIPTION="Synchronization of locally encrypted data among devices"
EGIT_REPO_URI="https://github.com/leapcode/soledad.git"
EGIT_COMMIT=${PV}
HOMEPAGE="https://leap.se/en/docs/soledad"
KEYWORDS="~amd64 ~x86"
LICENSE=GPL-3
S="${WORKDIR}/${P}/client"
SLOT=0

RDEPEND="net-misc/soledad-common[${PYTHON_USEDEP}]
	net-zope/zope-proxy[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}"

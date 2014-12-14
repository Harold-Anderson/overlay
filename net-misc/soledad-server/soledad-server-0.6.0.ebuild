# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit eutils git-r3 distutils-r1

DESCRIPTION="Synchronization of locally encrypted data among devices"
HOMEPAGE="https://leap.se/en/docs/soledad"
EGIT_REPO_URI="https://github.com/leapcode/soledad.git"
EGIT_COMMIT=${PV}

LICENSE=GPL-3
SLOT=0

KEYWORDS="~amd64 ~x86"

RDEPEND="net-misc/soledad-common[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}"

S=${WORKDIR}/${P}/server

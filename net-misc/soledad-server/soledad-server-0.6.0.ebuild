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

LICENSE="CC-BY-SA-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="net-misc/soledad-common"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${P}/server"
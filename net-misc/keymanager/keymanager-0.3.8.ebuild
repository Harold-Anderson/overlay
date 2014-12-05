# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_4} )

inherit eutils git-r3 distutils-r1

DESCRIPTION="A Nicknym agent for the LEAP project"
HOMEPAGE="https://leap.se/pt/docs/design/nicknym"
EGIT_REPO_URI="https://github.com/leapcode/${PN}.git"
EGIT_COMMIT="${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/simplejson[${PYTHON_USEDEP}]
	net-misc/leap_pycommon[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=app-crypt/gnupg-1.2.3
	dev-python/enum34[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}"
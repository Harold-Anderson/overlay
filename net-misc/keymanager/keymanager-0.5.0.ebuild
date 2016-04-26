# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit eutils git-r3 distutils-r1

DESCRIPTION="A Nicknym agent for the LEAP project"
HOMEPAGE="https://leap.se/pt/docs/design/nicknym"

EGIT_REPO_URI="https://github.com/leapcode/keymanager.git"
EGIT_COMMIT="${PV}"

LICENSE=GPL-3
SLOT=0

KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/simplejson[${PYTHON_USEDEP}]
	net-misc/leap_pycommon[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/gnupg-1.2.3[${PYTHON_USEDEP}]
	python_targets_python2_7? ( dev-python/enum[${PYTHON_USEDEP}] )"

DEPEND="${RDEPEND}"
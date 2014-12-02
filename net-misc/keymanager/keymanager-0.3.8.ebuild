# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_4} )

inherit eutils git-r3 distutils-r1

DESCRIPTION="A Nicknym agent for the LEAP project"
HOMEPAGE="https://leap.se/pt/docs/design/nicknym"
EGIT_REPO_URI="https://github.com/leapcode/keymanager.git"
EGIT_COMMIT="${PV}"

LICENSE="CC-BY-SA-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/simplejson
	net-misc/leap_pycommon
	dev-python/requests
	>=app-crypt/gnupg-1.2.3
	dev-python/enum34"

DEPEND="${RDEPEND}"
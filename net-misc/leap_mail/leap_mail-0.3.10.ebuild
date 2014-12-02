# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_4} )

inherit eutils git-r3 distutils-r1

DESCRIPTION="Common utilities for leap python modules."
HOMEPAGE="https://leap.se"
EGIT_REPO_URI="https://github.com/leapcode/${PN}.git"
EGIT_COMMIT="${PV}"

LICENSE="CC-BY-SA-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="net-zope/zope-interface
	>=net-misc/soledad-client-0.4.5
	>=net-misc/leap_pycommon-0.3.7
	>=net-misc/keymanager-0.3.8
	dev-python/enum34
	dev-python/twisted-web"

DEPEND="${RDEPEND}"
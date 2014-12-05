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

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=dev-libs/protobuf-2.4.1
	dev-libs/openssl
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pyopenssl[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/dirspec[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}"
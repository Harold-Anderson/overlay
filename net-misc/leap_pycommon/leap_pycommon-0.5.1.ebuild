# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python2_7 )

inherit eutils git-r3 distutils-r1

DESCRIPTION="Common utilities for leap python modules"
HOMEPAGE="https://leap.se"

EGIT_REPO_URI="https://github.com/leapcode/leap_pycommon.git"
EGIT_COMMIT=${PV}

LICENSE=GPL-3
SLOT=0

KEYWORDS="~amd64 ~x86"

RDEPEND="dev-libs/protobuf
	dev-python/protobuf-socketrpc[${PYTHON_USEDEP}]
	dev-python/routes[${PYTHON_USEDEP}]
	dev-libs/openssl:0
	~dev-python/python-dateutil-1.5[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-0.14[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/paste[${PYTHON_USEDEP}]
	dev-python/dirspec[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}"

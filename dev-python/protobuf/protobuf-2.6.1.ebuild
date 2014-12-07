# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Protocol Buffers are Google's data interchange format."
HOMEPAGE="https://developers.google.com/protocol-buffers"
SRC_URI="mirror://pypi/p/${PN}/${P}.tar.gz"
IUSE=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="${PYTHON_DEPS}"

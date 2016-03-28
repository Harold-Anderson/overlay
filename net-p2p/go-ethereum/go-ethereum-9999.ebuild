# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

SCM=""
KEYWORDS=""
if [[ ${PV} == 9999* ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/ethereum/${PN}.git"
else
	KEYWORDS="~amd64 ~x86"
	SRC_URI="https://github.com/ethereum/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

inherit eutils ${SCM}

DESCRIPTION="Official golang implementation of the Ethereum protocol"
HOMEPAGE="https://github.com/ethereum/go-ethereum"

LICENSE="GPL-3+ LGPL-3+"
SLOT="0"
IUSE="evm"

DEPEND="
	dev-lang/go
"
RDEPEND="${DEPEND}"
# Build time dependencies
DEPEND+=""

src_prepare() {
	sed -i \
		-e 's|\$(GOROOT)/bin/go|go|g' \
		Makefile

	epatch_user
}

src_compile() {
	emake geth
	use evm && emake evm
}

src_install() {
	for d in README* COPYING* AUTHORS; do
		[[ -s "${d}" ]] && dodoc "${d}"
	done
	dobin build/bin/geth
	use evm && dobin build/bin/evm
}

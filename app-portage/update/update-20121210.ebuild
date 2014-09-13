# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A most excellent portage wrapper"
HOMEPAGE="http://weaver.gentooexperimental.org/update.html"
SRC_URI="http://weaver.gentooexperimental.org/src/update/update-${PV}.tar.bz2"
RESTRICT="mirror"

LICENSE="CC-BY-SA-3.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=">app-shells/bash-3.1
sys-apps/ed
dev-util/dialog
app-portage/portage-utils
app-portage/gentoolkit
net-misc/curl"

src_install() {
insinto /etc || die
doins warning || die
insinto /usr || die
dosbin update || die
dolib libIgli || die
}

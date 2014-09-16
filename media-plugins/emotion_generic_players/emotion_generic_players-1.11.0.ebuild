# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
DESCRIPTION="Players for Emotion using generic module."
HOMEPAGE="http://www.enlightenment.org"
SRC_URI="http://download.enlightenment.org/rel/libs/${PN}/${PN}-${PV}.tar.gz"
inherit autotools eutils
KEYWORDS="~x86 ~amd64"
LICENSE="BSD-2"
SLOT="0"
IUSE=""
RDEPEND="media-video/vlc"
DEPEND="${RDEPEND}"
#S="${WORKDIR}/${P/_/-}"

pkg_setup()
{
	return
}

src_prepare() {
if [[ ! -e configure ]] ; then
eautoreconf
fi
}

src_install() {
default
}
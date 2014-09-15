# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:
EAPI=5
DESCRIPTION="Players for Emotion using generic module."
HOMEPAGE="http://www.enlightenment.org"
EGIT_REPO_URI="http://git.enlightenment.org/core/${PN}.git"
inherit git-2 autotools eutils
EGIT_BRANCH="master"
KEYWORDS="x86 amd64"
LICENSE="BSD-2"
SLOT="0"
IUSE=""
RDEPEND="media-video/vlc"
DEPEND="${RDEPEND}"
src_prepare() {
if [[ ! -e configure ]] ; then
eautoreconf
fi
}
src_install() {
default
}

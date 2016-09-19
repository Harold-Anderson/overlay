# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="open source code editor for web designers and front-end developers"
HOMEPAGE="http://brackets.io"
SRC_URI="amd64?	( https://github.com/adobe/brackets/releases/download/release-${PV}/Brackets.Release.${PV}.64-bit.deb )
	x86?	( https://github.com/adobe/brackets/releases/download/release-${PV}/Brackets.Release.${PV}.32-bit.deb )"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="chromium"

RDEPEND="
>=dev-libs/openssl-0.9.7d
>=gnome-base/gconf-2.31.1
>=media-libs/alsa-lib-1.0.23
>=dev-libs/atk-1.12.4
>=x11-libs/cairo-1.6.0
>=net-print/cups-1.4.0
>=sys-apps/dbus-1.2.14
>=dev-libs/expat-1.95.8
>=media-libs/fontconfig-2.8.0
>=media-libs/freetype-2.3.9
>=sys-devel/gcc-4.1.1
dev-libs/libgcrypt:11/11
>=x11-libs/gdk-pixbuf-2.22.0
>=dev-libs/glib-2.18.0
>=x11-libs/gtk+-2.24.0
>=dev-libs/nspr-1.8.0.10
>=dev-libs/nss-3.12.6
>=x11-libs/pango-1.22.0
>=virtual/libudev-198
>=x11-libs/libX11-1.4.99.1
>=x11-libs/libXcomposite-0.3-r1
>=x11-libs/libXdamage-1.1
x11-libs/libXext
x11-libs/libXfixes
>=x11-libs/libXrandr-1.2.0
x11-libs/libXrender
app-misc/ca-certificates
net-misc/curl
>=x11-misc/xdg-utils-1.0.2
net-misc/wget
chromium? ( www-client/chromium )
>=app-arch/deb2targz-1-r2"

DEPEND="sys-devel/binutils"

S="${WORKDIR}"

src_unpack() {
	echo "*** A = ${A}"
	#unpack ${A}
	ls -la "${DISTDIR}"
	ln -sf "${DISTDIR}"/${A} ${A}
	ls -la
	deb2targz ${A} || exit 1
	rm -f ${A}
	mv Brackets.Release.${PV}.64-bit.tar.xz data.tar.xz || exit 1
	echo "*** After unpack ***"
}

src_install() {
tar xJf data.tar.xz -C "${D}"
}

pkg_postinst() {
ln -s /usr/lib/libudev.so /opt/brackets/libudev.so.0
}

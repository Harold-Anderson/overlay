# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Enlightenment DR19 window manager"
HOMEPAGE="http://www.enlightenment.org/"
SRC_URI="http://download.enlightenment.org/rel/apps/${PN}/${P/_/-}.tar.gz"

LICENSE="BSD-2"
KEYWORDS="~amd64 ~x86"
SLOT="0.19"

E_MODULES_DEFAULT=(
	conf-applications conf-bindings conf-dialogs conf-display conf-interaction
	conf-intl conf-menus conf-paths conf-performance conf-randr conf-shelves
	conf-theme conf-window-manipulation conf-window-remembers

	appmenu backlight battery bluez4 clock connman contact cpufreq everything
	fileman fileman-opinfo gadman ibar ibox lokker mixer msgbus music-control
	notification pager pager16 quickaccess shot start syscon systray tasks
	teamwork temperature tiling winlist wizard xkbswitch
)
E_MODULES=(
	access packagkit wl-desktop-shell wl-drm wl-fb wl-x11
)
IUSE_E_MODULES=(
	"${E_MODULES_DEFAULT[@]/#/+enlightenment_modules_}"
	"${E_MODULES[@]/#/enlightenment_modules_}"
)
IUSE="doc +eeze egl nls pam pm-utils static-libs systemd ukit wayland ${IUSE_E_MODULES[@]}"

RDEPEND="
	>=dev-libs/efl-1.11.2[X,egl?,wayland?]
	>=media-plugins/evas_generic_loaders-1.11.2
	>=media-plugins/emotion_generic_players-1.11.0
	>=media-libs/elementary-1.11.2
	virtual/udev
	x11-libs/libxcb
	x11-libs/xcb-util-keysyms
	enlightenment_modules_mixer? ( >=media-libs/alsa-lib-1.0.8 )
	nls? ( sys-devel/gettext )
	pam? ( sys-libs/pam )
	pm-utils? ( sys-power/pm-utils )
	systemd? ( sys-apps/systemd )
	wayland? (
		>=dev-libs/wayland-1.3.0
		>=x11-libs/pixman-0.31.1
		>=x11-libs/libxkbcommon-0.3.1
	)"
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )"

S="${WORKDIR}/${P/_/-}"

src_configure() {
	local config=(
		--disable-device-hal
		--disable-simple-x11
		--disable-wayland-only

		--enable-conf
		--enable-device-udev # instead of hal
		--enable-enotify
		--enable-files
		--enable-install-enlightenment-menu
		--enable-install-sysactions

		$(use_enable doc)
		$(use_enable egl wayland-egl)
		$(use_enable nls)
		$(use_enable pam)
		$(use_enable static-libs static)
		$(use_enable systemd)
		$(use_enable ukit mount-udisks)
		$(use_enable eeze mount-eeze)
		$(use_enable wayland wayland-clients)
	)

	local i
	for i in ${E_MODULES_DEFAULT} ${E_MODULES}; do
		config+=( $(use_enable enlightenment_modules_${i} ${i}) )
	done

	if use wayland; then
		config+=( --enable-enlightenment_modules_wl-desktop-shell )
	fi

	econf "${config[@]}"
}

src_install() {
	default
	prune_libtool_files
}

# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit eutils git-r3 distutils-r1

DESCRIPTION="Desktop client for the LEAP Platform"
EGIT_REPO_URI="https://github.com/leapcode/${PN}.git"
EGIT_COMMIT="${PV}"
HOMEPAGE="https://leap.se/en/docs/client"
KEYWORDS="~amd64 ~x86"
LICENSE=GPL-3
SLOT=0

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
	dev-python/srp[${PYTHON_USEDEP}]
	dev-python/pyside[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-0.14[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/ipaddr[${PYTHON_USEDEP}]
	dev-python/python-daemon[${PYTHON_USEDEP}]
	dev-python/keyring[${PYTHON_USEDEP}]
	dev-python/oauth[${PYTHON_USEDEP}]
	dev-python/pyzmq[${PYTHON_USEDEP}]
	>=net-misc/leap_mail-0.3.9[${PYTHON_USEDEP}]
	>=net-misc/soledad-client-0.5.0[${PYTHON_USEDEP}]
	>=net-misc/leap_pycommon-0.3.7[${PYTHON_USEDEP}]
	>=net-misc/keymanager-0.3.8[${PYTHON_USEDEP}]
	dev-python/twisted-web[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}
	sys-apps/dbus
	sys-auth/polkit
	sys-auth/consolekit
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-libs/openssl
	net-misc/openvpn
	dev-python/pyside-tools
	dev-python/pyside[${PYTHON_USEDEP}]
	dev-ruby/ffi"

python_prepare_all() {
	distutils-r1_python_prepare_all
}

python_compile_all() {
	"${PYTHON}" setup.py build || die
	make || die
}

python_install() {
	doexe pkg/linux/bitmask-root
	insinto /usr/share/polkit-1/actions
	doins "${S}/pkg/linux/polkit/se.leap.bitmask.policy"
	distutils-r1_python_install
}

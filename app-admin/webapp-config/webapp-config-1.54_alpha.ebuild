# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

SUPPORT_PYTHON_ABIS="1"
PYTHON_COMPAT=( python{2_7,3_4} )

inherit eutils git-r3 distutils-r1

DESCRIPTION="Gentoo's installer for web-based applications (Experimental branch)"
HOMEPAGE="http://sourceforge.net/projects/webapp-config/"
EGIT_REPO_URI="git://git.overlays.gentoo.org/proj/${PN}.git"
EGIT_BRANCH="experimental"

DEPEND="app-text/xmlto"
RDEPEND=""
PYTHON_MODNAME="WebappConfig"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

src_compile() {
	BUILD_DIR="${WORKDIR}/${P}_build"
	distutils-r1_python_compile
	emake -C doc/
}

src_install() {
	python_export_best

	distutils-r1_python_install --install-scripts="/usr/sbin"
	insinto /etc/vhosts
	doins config/webapp-config

	keepdir /usr/share/webapps
	keepdir /var/db/webapps

	dodoc AUTHORS
	doman doc/*.[58]
	dohtml doc/*.[58].html
}

python_test() {
	PYTHONPATH="." "${PYTHON}" WebappConfig/tests/dtest.py \
		|| die "Tests fail with ${EPYTHON}";
}

pkg_postinst() {
	distutils-r1_pkg_postinst

	elog "Now that you have upgraded webapp-config, you **must** update your"
	elog "config files in /etc/vhosts/webapp-config before you emerge any"
	elog "packages that use webapp-config."
	elog ""
	elog "Please note that the syntax of webapp-config has changed."
        elog "The new syntax is webapp-config -h localhost  -d /foominator -I foominator 3.4.0_alpha"
}

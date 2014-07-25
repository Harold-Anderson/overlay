# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils
inherit webapp depend.php

MAGIC_1="19524"
MAGIC_2="159413"

DESCRIPTION="Content Management System."
HOMEPAGE="http://www.joomla.org/"
SRC_URI="http://joomlacode.org/gf/download/frsrelease/${MAGIC_1}/${MAGIC_2}/Joomla_${PV}-Stable-Full_Package.zip"

LICENSE="GPL-2"
KEYWORDS="~amd64"
#IUSE="+json +mysql +zlib +xml"

need_httpd_cgi
need_php_httpd

S="${WORKDIR}"

DEPEND="${DEPEND}
	app-arch/unzip"
RDEPEND="dev-lang/php[json,mysql,zlib,xml]
	 >dev-db/mysql-5.1"

src_install () {
	webapp_src_preinst

	dodoc installation/CHANGELOG installation/INSTALL README.txt

	touch configuration.php
	insinto "${MY_HTDOCSDIR}"
	doins -r .

	local files=" administrator/cache administrator/components
	administrator/language administrator/language/en-GB
	administrator/manifests/packages
	administrator/modules administrator/templates cache components images installation
	images/banners language language/en-GB media modules plugins
	plugins/authentication plugins/content plugins/editors plugins/editors-xtd
	plugins/search plugins/system plugins/user plugins tmp templates"

	for file in ${files}; do
		webapp_serverowned -R "${MY_HTDOCSDIR}"/${file}
	done

	webapp_configfile "${MY_HTDOCSDIR}"/configuration.php
	webapp_serverowned "${MY_HTDOCSDIR}"/configuration.php

	webapp_postinst_txt en "${FILESDIR}"/postinstall-en.txt
	webapp_postinst_txt sv "${FILESDIR}"/postinstall-sv.txt
	webapp_src_install
}

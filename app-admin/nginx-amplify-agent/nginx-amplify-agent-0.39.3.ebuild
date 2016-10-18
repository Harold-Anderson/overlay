# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

PYTHON_COMPAT=( python2_7 )
#DISTUTILS_SINGLE_IMPL=1

inherit eutils distutils-r1 user versionator

DESCRIPTION="System and NGINX metric collection"
HOMEPAGE="https://amplify.nginx.com"
MY_PV=$(replace_version_separator 2 '-')
MY_PV1=$(get_version_component_range 1-2)
FNAME="${PN}-${MY_PV}"
SRC_URI="https://github.com/nginxinc/${PN}/archive/v${MY_PV}.zip"
LICENSE="BSD-2 BSD SSLeay MIT GPL-2 GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"
RDEPEND="
	dev-python/gevent[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/netifaces[${PYTHON_USEDEP}]
	dev-python/ujson[${PYTHON_USEDEP}]
	dev-python/python-daemon[${PYTHON_USEDEP}]
	dev-python/netaddr[${PYTHON_USEDEP}]
	www-servers/nginx[nginx_modules_http_stub_status]
"

S="${WORKDIR}/${FNAME}"

python_install_all() {
	distutils-r1_python_install_all
	newinitd "${FILESDIR}"/nginx-amplify-agent.initd nginx-amplify-agent

	keepdir /var/log/amplify-agent/ /var/run/amplify-agent

}

pkg_postinst() {

	sed "s%api_key =%api_key = $API_KEY%"  \
	    /etc/amplify-agent/agent.conf.default > /etc/amplify-agent/agent.conf

	if [ ! -z $HOSTNAME ]; then
		sed -i "s%hostname =%hostname = $HOSTNAME%"  \
		  /etc/amplify-agent/agent.conf
	fi

	# TODO correct way to set same user as www-server/nginx
	chown nginx /var/log/amplify-agent
	# agent rewrites file itself, needs to be writable
	chown nginx /etc/amplify-agent/agent.conf
	chown nginx /var/run/amplify-agent
}

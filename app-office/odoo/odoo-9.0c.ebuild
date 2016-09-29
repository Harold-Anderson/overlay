# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

PYTHON_COMPAT=( python2_7 )
DISTUTILS_SINGLE_IMPL=1

inherit eutils distutils-r1 user

DESCRIPTION="Open Source ERP & CRM"
HOMEPAGE="http://www.odoo.com/"
MY_PV="9.0c-20160923"
FNAME="${PN}-${MY_PV}"
SRC_URI="http://nightly.odoo.com/9.0/nightly/src/odoo_9.0c.20160923.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+postgres ldap ssl"

DEPEND="postgres? ( dev-db/postgresql:*[server] )
	dev-python/markupsafe[${PYTHON_USEDEP}]
	dev-python/argparse
	dev-python/decorator[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/pyPdf[${PYTHON_USEDEP}]
	dev-python/psycogreen
	dev-python/gevent[${PYTHON_USEDEP}]
	dev-python/ofxparse[${PYTHON_USEDEP}]
	dev-python/jcconv[${PYTHON_USEDEP}]
	dev-python/pyusb[${PYTHON_USEDEP}]
	dev-python/passlib[${PYTHON_USEDEP}]
	dev-python/greenlet[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/beautifulsoup:4[${PYTHON_USEDEP}]
	dev-python/suds[${PYTHON_USEDEP}]
	dev-python/docutils[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/psycopg:2[${PYTHON_USEDEP}]
	dev-python/pychart[${PYTHON_USEDEP}]
	dev-python/pyparsing[${PYTHON_USEDEP}]
	dev-python/reportlab[${PYTHON_USEDEP}]
	dev-python/wsgiref[${PYTHON_USEDEP}]
	dev-python/simplejson[${PYTHON_USEDEP}]
	media-gfx/pydot
	dev-python/vobject[${PYTHON_USEDEP}]
	dev-python/mako[${PYTHON_USEDEP}]
	dev-python/mock[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/Babel[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/gdata[${PYTHON_USEDEP}]
	ldap? ( dev-python/python-ldap[${PYTHON_USEDEP}] )
	dev-python/python-openid[${PYTHON_USEDEP}]
	dev-python/werkzeug[${PYTHON_USEDEP}]
	dev-python/xlwt[${PYTHON_USEDEP}]
	dev-python/feedparser[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pywebdav[${PYTHON_USEDEP}]
	ssl? ( dev-python/pyopenssl[${PYTHON_USEDEP}] )
	dev-python/vatnumber[${PYTHON_USEDEP}]
	dev-python/zsi[${PYTHON_USEDEP}]
	dev-python/unittest2[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/pillow[jpeg,${PYTHON_USEDEP}]
	${PYTHON_DEPS}
	net-libs/nodejs[npm]
	dev-nodejs/less
	"

RDEPEND="${DEPEND}"

ODOO_USER="odoo"
ODOO_GROUP="odoo"

S="${WORKDIR}/${FNAME}"

python_install_all() {
	distutils-r1_python_install_all

	newinitd "${FILESDIR}/${PN}-2" "${PN}"
	newconfd "${FILESDIR}/odoo-confd-2" "${PN}"
	keepdir /var/log/odoo

	insinto /etc/logrotate.d
	newins "${FILESDIR}"/odoo.logrotate odoo
	dodir /etc/odoo
	insinto /etc/odoo
	newins "${FILESDIR}"/odoo.cfg.2 odoo.cfg

	# #453424 Fix error on /usr/openerp/import_xml.rng
	dosym /usr/openerp/import_xml.rng $(python_get_sitedir)/${PN}/import_xml.rng

	# #453424 Fix error on /usr/openerp/addons/base/res/res_company_logo.png
	dosym /usr/openerp/addons/base/res/res_company_logo.png $(python_get_sitedir)/${PN}/addons/base/res/res_company_logo.png
}

pkg_preinst() {
	enewgroup ${ODOO_GROUP}
	enewuser ${ODOO_USER} -1 -1 -1 ${ODOO_GROUP}

	fowners -R ${ODOO_USER}:${ODOO_GROUP} /etc/odoo
	fowners ${ODOO_USER}:${ODOO_GROUP} /var/log/odoo
	fowners -R ${ODOO_USER}:${ODOO_GROUP} "$(python_get_sitedir)/${PN}/addons/"

	fperms 0640 /etc/odoo/odoo.cfg

	use postgres || sed -i '6,8d' "${D}/etc/init.d/odoo" || die "sed failed"
}

pkg_postinst() {
	chown -R ${ODOO_USER}:${ODOO_GROUP} /etc/odoo
	chown ${ODOO_USER}:${ODOO_GROUP} /var/log/odoo
	chown -R ${ODOO_USER}:${ODOO_GROUP} "$(python_get_sitedir)/${PN}/addons/"

	elog "In order to setup the initial database and user, run:"
	elog " emerge --config =${CATEGORY}/${PF}"
	elog "Be sure the database is started first."
	elog "The default configuration for Postgres is not to require passwords."
	elog "If you have not changed this, then postgres will not ask you to set a password for odoo."
	elog "In this case, you should remove the password from /etc/odoo/odoo.cfg"
	elog "   "
	elog "Please note that the configuration file is /etc/odoo/odoo.cfg"
	elog "You need to modify the parameters in that file before starting the service."
	elog "In particular, the database user and password you chose when you ran emerge --config "
	elog "in the previous step need to be reflected in the config file."
	elog "   "
	elog "Please start the odoo service like this:  # /etc/init.d/odoo start"
	elog "Please access the server on port 8069 from your web browser."
	elog "Please allow a very long time for the login screen to appear."
	elog "Please note that /etc/init.d/odoo status may show that the server has crashed."
	elog "This seems to be normal, but does not affect operations."
	elog "Please note that the first login to the server takes a very long time."
}

psqlquery() {
	psql -q -At -U postgres -d template1 -c "$@"
}

pkg_config() {
	einfo "In the following, the 'postgres' user will be used."
	if ! psqlquery "SELECT usename FROM pg_user WHERE usename = '${ODOO_USER}'" | grep -q ${ODOO_USER}; then
		ebegin "Creating database user ${ODOO_USER}"
		createuser --username=postgres --createdb --no-adduser ${ODOO_USER}
		eend $? || die "Failed to create database user"
	fi
	if ! psqlquery "SELECT datname FROM pg_database WHERE datistemplate=false and datname = '${ODOO_USER}'" | grep -q ${ODOO_USER}; then
		ebegin "Creating database ${ODOO_USER}"
		createdb --username=postgres -O ${ODOO_USER} ${ODOO_USER}
		eend $? || die "Failed to create database"
	fi
}

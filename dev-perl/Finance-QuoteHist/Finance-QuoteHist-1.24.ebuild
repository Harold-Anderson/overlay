# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DIST_AUTHOR="MSISK"
DIST_VERSION=${PV}
inherit perl-module

DESCRIPTION="Get stock and mutual fund quotes from various exchanges"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~x86"
IUSE="test"

# virtual/perl-Data-Dumper currently commented out in the code

RDEPEND="
	dev-perl/CGI
	virtual/perl-Carp
	dev-perl/DateTime
	dev-perl/Text-CSV
	virtual/perl-Encode
	virtual/perl-Exporter
	dev-perl/HTML-Parser
	dev-perl/HTML-TableExtract
	dev-perl/HTML-Tree
	dev-perl/HTTP-Cookies
	dev-perl/HTTP-Message
	dev-perl/JSON
	dev-perl/LWP-Protocol-https
	dev-perl/libwww-perl
	dev-perl/Mozilla-CA
	dev-perl/Finance-Quote
	virtual/perl-Time-Piece
	dev-perl/URI
"
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
	test? (
		virtual/perl-Data-Dumper
		virtual/perl-File-Spec
		virtual/perl-Test-Simple
		dev-perl/Test-Pod
		dev-perl/Perl-Critic-Dynamic
	)
"

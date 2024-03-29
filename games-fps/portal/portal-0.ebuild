# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit games

DESCRIPTION="Portal"
HOMEPAGE="http://orange.half-life2.com/portal.html"
SRC_URI="Portal.tar.gz"

LICENSE="unknown"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"

IUSE=""
RESTRICT="strip fetch"

DEPEND=""
RDEPEND="dev-libs/nss[abi_x86_32]
         dev-libs/nspr[abi_x86_32]
         dev-libs/libgcrypt:11[abi_x86_32]
         media-libs/libsdl2[abi_x86_32]
         x11-libs/cairo[abi_x86_32]
         x11-libs/gtk+:2[abi_x86_32]
         net-print/cups[abi_x86_32]
         media-libs/libpng:1.2[abi_x86_32]
         media-libs/libtxc_dxtn[abi_x86_32]"

S="${WORKDIR}"

src_unpack() {
	return
}

src_prepare() {

	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/Portal/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.local\/share\/Portal/g" "${FILESDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {
	local dir="${GAMES_PREFIX_OPT}/Portal"

	dodir "${GAMES_PREFIX_OPT}"
	tar -xzf "${DISTDIR}/Portal.tar.gz" -C "${D}/${GAMES_PREFIX_OPT}"
	find "${D}/${GAMES_PREFIX_OPT}/Portal" -name *.cache -print0 | xargs -0 rm

	dogamesbin "${PN}"
	doicon "${D}/${GAMES_PREFIX_OPT}/Portal/portal/resource/game.ico"
	make_desktop_entry "${PN}" "Portal" "${PN}"

	prepgamesdirs
}


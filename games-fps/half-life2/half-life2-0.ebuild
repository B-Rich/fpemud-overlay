# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit games

DESCRIPTION="Half-life2"
HOMEPAGE="http://orange.half-life2.com/portal.html"
SRC_URI="HL2.tar.gz"

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
         media-libs/libpng:1.2[abi_x86_32]"

S="${WORKDIR}"

src_unpack() {
	return
}

src_install() {
	local dir="${GAMES_PREFIX_OPT}/HL2"

	dodir "${GAMES_PREFIX_OPT}"
	tar -xzf "${DISTDIR}/HL2.tar.gz" -C "${D}/${GAMES_PREFIX_OPT}"

	games_make_wrapper "${PN}" "./${PN}" "${dir}"
	make_desktop_entry "${PN}" "Half-life2" "${PN}"

	prepgamesdirs
}

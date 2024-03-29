# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2

DESCRIPTION="Build boot environment(kernel/initrd/bootloader/...) for fpemud's systems"
SRC_URI=""
EGIT_REPO_URI="git://github.com/fpemud/fpemud-kernelmanager.git"
KEYWORDS="-* amd64 x86"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="sys-kernel/gentoo-sources
         sys-apps/kmod
         sys-apps/diffutils
         dev-python/kconfiglib
         dev-python/pyudev"
DEPEND="${RDEPEND}"

pkg_postrm() {
	find "${EROOT}/usr/lib/fpemud-kernelmanager" -name "*.pyc" | xargs rm -f

	# Delete empty parent directories.
	local dir="${EROOT}/usr/lib/fpemud-kernelmanager"
	while [[ "${dir}" != "${EROOT%/}" ]]; do
		rmdir "${dir}" 2> /dev/null || break
		dir="${dir%/*}"
	done
}

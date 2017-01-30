DESCRIPTION = "Linux kernel for the R-Car Generation 3 based board"

require recipes-kernel/linux/linux-yocto.inc

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}/${MACHINE}:"
COMPATIBLE_MACHINE = "(salvator-x|h3ulcb|m3ulcb)"

RENESAS_BSP_URL = "git://github.com/xen-troops/linux.git"
BRANCH = "v4.9/rcar-3.5.1-xt"
SRCREV = "${AUTOREV}"

SRC_URI = "${RENESAS_BSP_URL};protocol=git;nocheckout=1;branch=${BRANCH}"

LINUX_VERSION ?= "4.9"
PV = "${LINUX_VERSION}+git${SRCPV}"
PR = "r1"

SRC_URI_append = " \
    file://defconfig \
"

SRC_URI_append_salvator-x = ""

DESCRIPTION = "Linux kernel for the R-Car Generation 3 based board"

require recipes-kernel/linux/linux-yocto.inc

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}/${MACHINE}:"
COMPATIBLE_MACHINE = "(salvator-x|h3ulcb|m3ulcb)"

RENESAS_BSP_URL = "git://github.com/aanisov/linux.git"
BRANCH = "v4.9/rcar-3.5.1-xt-domd-wip"
SRCREV = "${AUTOREV}"

SRC_URI = "${RENESAS_BSP_URL};protocol=git;nocheckout=1;branch=${BRANCH}"

LINUX_VERSION ?= "4.9"
PV = "${LINUX_VERSION}+git${SRCPV}"
PR = "r1"

SRC_URI_append = " \
    file://defconfig \
"

SRC_URI_append_salvator-x = ""

do_install_append() {
    install -d ${D}${base_prefix}/xen
    install -m 0644 ${B}/arch/${ARCH}/boot/dts/renesas/domd-0.dtb ${D}${base_prefix}/xen/domd-0.dtb
    install -m 0644 ${B}/arch/${ARCH}/boot/dts/renesas/domd-3.dtb ${D}${base_prefix}/xen/domd-3.dtb
}

PACKAGES += "guest-images"
FILES_guest-images = "${base_prefix}/xen/*"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

LIC_FILES_CHKSUM = "file://COPYING;md5=bbb4b1bdc2c3b6743da3c39d03249095"

DEPENDS += "u-boot-mkimage-native systemd"

PACKAGECONFIG ?= " \
    xsm \
    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
    ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'hvm', '', d)} \
    "

XEN_REL="4.8"
SRC_URI = " \
    git://xenbits.xen.org/xen.git;branch=master \
    "
SRCREV = "58bd0c7985890e0292212f94a56235228a3445c3"

FLASK_POLICY_FILE="xenpolicy-4.8.0-rc"

SRC_URI += "\
    file://0001-arm64-renesas-Introduce-early-console-for-Salvator-X.patch \
    file://0002-char-scif-Add-Renesas-Salvator-X-board-support.patch \
    file://0003-Enable-XSM.patch \ 
    file://0004-HACK-Fix-compilation-issues.patch \
    file://0005-Hack.patch \
    file://0001-tools-libacpi-Fix-compilation-when-cross-building-th.patch \
    "

EXTRA_OEMAKE += " CONFIG_HAS_SCIF=y CONFIG_DEBUG=y CONFIG_EARLY_PRINTK=salvator CONFIG_QEMU_XEN=n"

PACKAGES += "\
    ${PN}-livepatch \
    "

RDEPENDS_${PN}-base += "\
    ${PN}-livepatch \
    "

FILES_${PN}-hypervisor += "\
    /usr/lib/debug/xen-syms-* \
    "

FILES_${PN}-scripts-block += " \
    ${sysconfdir}/xen/scripts/block-dummy \
    "

FILES_${PN}-scripts-network += " \
    ${sysconfdir}/xen/scripts/colo-proxy-setup \
    "

FILES_${PN}-livepatch += "\
    /usr/sbin/xen-livepatch \
    "

FILES_${PN}-staticdev += "\
    ${exec_prefix}/lib64/libxenstore.a \
    ${exec_prefix}/lib64/libxenvchan.a \
    "

FILES_${PN}-xencommons += " \
    ${systemd_unitdir}/system/xendriverdomain.service \
    ${sysconfdir}/xen/scripts/launch-xenstore \
    "

FILES_${PN}-xencommons_remove += " \
    ${systemd_unitdir}/system/xenstored.socket \
    ${systemd_unitdir}/system/xenstored_ro.socket \
    "

SYSTEMD_SERVICE_${PN}-xencommons += " \
    xendriverdomain.service \
    "

SYSTEMD_SERVICE_${PN}-xencommons_remove += " \
    xenstored.socket \
    xenstored_ro.socket \
    "

FILES_${PN}-libxencall-dev = "${exec_prefix}/lib64/libxencall.so"

FILES_${PN}-efi = ""

RDEPENDS_${PN}-efi = " \
    bash \
    python \
    "

do_deploy_append () {
    if [ -f ${D}/boot/xen ]; then
        uboot-mkimage -A arm64 -C none -T kernel -a 0x78080000 -e 0x78080000 -n "XEN" -d ${D}/boot/xen ${DEPLOYDIR}/xen-${MACHINE}.uImage
    fi
}

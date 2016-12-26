FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# aufs kernel support required for xen-image-minimal
KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"

RENESAS_BSP_URL = "git://github.com/xen-troops/linux.git"
BRANCH = "4.6/rcar-3.3.2-demo"
SRCREV = "4.6/rcar-3.3.2-demo"

SRC_URI = "${RENESAS_BSP_URL};protocol=git;nocheckout=1;branch=${BRANCH}"

# kernel xen support
SRC_URI_append_salvator-x-xen-dom0 = " file://xen_dom0.cfg "

#SRC_URI_append_salvator-x-xen-domd = " file://xen_domd.scc"

SRC_URI_append_salvator-x-xen = " \
    file://defconfig \
"

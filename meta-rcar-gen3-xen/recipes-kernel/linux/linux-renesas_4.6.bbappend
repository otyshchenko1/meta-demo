FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# aufs kernel support required for xen-image-minimal
KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"

# kernel xen support and patches 
SRC_URI_append_salvator-x-xen-dom0 = "  file://patches/dom0/0001-clk-shmobile-Hide-clock-for-SCIF2.patch \
					file://patches/dom0/0002-arm64-dts-renesas-Introduce-device-tree-for-Renesas-.patch \
					file://patches/dom0/0003-arm64-dts-renesas-Adjust-device-tree-for-Renesas-Sal.patch \
					file://patches/dom0/0004-salvator-x-dom0-Move-all-memory-banks-to-a-single-no.patch \
					file://patches/dom0/0005-swiotlb-xen-implement-xen_swiotlb_dma_mmap-callback.patch \
					file://patches/dom0/0006-get-back-the-full-dts-for-a-reach-dom0.patch \
					file://patches/dom0/0007-drm-debug-stuff.patch \
					file://xen_dom0.cfg \
"

#SRC_URI_append_salvator-x-xen-domd = " file://xen_domd.scc"

SRC_URI_append_salvator-x-xen = " \
    file://defconfig \
"

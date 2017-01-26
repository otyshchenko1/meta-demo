FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# aufs kernel support required for xen-image-minimal
KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"

RENESAS_BSP_URL = "git://github.com/xen-troops/linux.git"
BRANCH = "4.6/rcar-3.3.2-dom0-thin"
SRCREV = "${AUTOREV}"

SRC_URI = "${RENESAS_BSP_URL};protocol=git;nocheckout=1;branch=${BRANCH}"

SRC_URI_remove = " \
    file://0001-arm64-renesas-Add-H3ULCB-board.patch \
    file://0002-staging-boards-Add-H3ULCB-staging.patch \
    file://0003-spi-sh-msiof-fixes.patch \
    file://0004-spi-spidev-add-spi-gpio-into-spidev.patch \
    file://0005-spi-spi-gpio-fix-CPOL-mode.patch \
    file://0006-xhci-rcar-add-firmware-for-R-Car-H2-M2-USB-3.0-host-.patch \
    file://0007-usb-host-xhci-plat-add-support-for-the-R-Car-H3-xHCI.patch \
    file://0008-spi-spi-gpio-fix-set-CPOL-default-inverted.patch \
    file://0009-Revert-media-soc_camera-rcar_vin-Fix-VIDIOC_S_CROP-ioctl-mi.patch \
    file://0010-mmc-sh_mobile_sdhi-Add-R-CarGen3-SDHI-SEQUENCER-supp.patch \
    file://0011-arm64-renesas-Add-M3ULCB-board.patch \
    file://0012-staging-boards-Add-M3ULCB-staging.patch \
    file://0019-can-rcar_can-add-enable-and-standby-control-pins.patch \
    file://0020-can-rcar-canfd-Add-Renesas-R-Car-CAN-FD-driver.patch \
    file://0021-arm64-dts-r8a7795-Add-CAN-FD-support.patch \
    file://0022-can-rcar_canfd-use-explicit-clock_select-from-dts.patch \
    file://0023-can-rcar_canfd-add-enable-and-standby-control-pins.patch \
    file://0024-mtd-Add-RPC-HyperFlash-driver.patch \
    file://0025-IMR-driver-interim-patch.patch \
    file://0040-H3-Maxim-MAX9286-support-support-10635-10640-cameras.patch \
    file://0050-arm64-renesas-Salvator-X-View-H3-board-support.patch \
    file://0051-arm64-renesas-H3ULCB-HAD-support.patch \
    file://0052-arm64-renesas-H3ULCB-View-board-support.patch \
    file://0053-arm64-renesas-Salvator-X-View-M3-board-support.patch \
    file://0054-arm64-renesas-M3ULCB-View-board-support.patch \
    file://0055-arm64-dts-r8a7795-h3ulcb-had-set-console-from-rdrive.patch \
    file://0056-arm64-dts-r8a7795-h3ulcb-had-route-RAVB-to-rdrive.patch \
"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}/${MACHINE}:"

SRC_URI_append_salvator-x-xen = " \
    file://defconfig \
"

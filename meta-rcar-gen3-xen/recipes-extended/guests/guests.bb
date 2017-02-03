# Copyright
# License:
#
# Filename: guests.bb

SUMMARY = "config files for guests"
DESCRIPTION = "config files for guest os'es for fusion"
PV = "0.1"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

SRC_URI = "\
  file://domd.cfg \
"

S = "${WORKDIR}"

do_install() {
    install -d ${D}${base_prefix}/xen
    install -m 0644 ${WORKDIR}/*.cfg ${D}${base_prefix}/xen
}

# PACKAGES += "alsa-states"

# RRECOMMENDS_alsa-state = "alsa-states"

FILES_${PN} = "${base_prefix}/xen/*.cfg"

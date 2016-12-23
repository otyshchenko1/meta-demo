PVRKM_URL = "git://github.com/xen-troops/pvr_km.git"
BRANCH = "h3/1.7/4128722-demo"
SRCREV = "h3/1.7/4128722-demo"

SRC_URI_r8a7795 = "${PVRKM_URL};protocol=http;branch=${BRANCH}"

S = "${WORKDIR}/git"

BUILD = "release"
#BUILD = "debug"
#EXTRA_OEMAKE += "BUILD=${BUILD} PDUMP=1 REFCOUNT_DEBUG=1 DEVMEM_DEBUG=1 MMU_OBJECT_REFCOUNT_DEBUGING=1 DC_DEBUG=1 PVR_RI_DEBUG=1"
KBUILD_OUTDIR_r8a7795 = "binary_r8a7795_linux_${BUILD}/target_aarch64/kbuild/"


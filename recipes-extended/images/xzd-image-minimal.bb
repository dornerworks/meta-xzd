DESCRIPTION = "A minimal XZD image (Xen + Petalinux)"

require recipes-core/images/petalinux-image-common.inc

IMAGE_FEATURES += "petalinux-xen"

IMAGE_INSTALL = " \
    packagegroup-core-boot \
    xen-xenstat \
    xen-vchan-example \
    ${COMMON_INSTALL} \
    iperf3 \
    python3 \
    python3-pyserial \
    python3-importlib \
    python3-modules \
    xenbridge \
    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    "

IMAGE_LINGUAS = " "

LICENSE = "MIT"

inherit core-image

DESCRIPTION = "A minimal XZD image (Xen + Petalinux)"

require recipes-core/images/petalinux-image-common.inc

IMAGE_FEATURES_append_zynqmp = " ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'petalinux-xen', '', d)} \
                               "

COMMON_INSTALL_remove_zynqmp = "hellopm"

IMAGE_INSTALL = " \
    packagegroup-core-boot \
    xen-xenstat \
    xen-vchan-example \
    ${COMMON_INSTALL} \
    iperf3 \
    python3 \
    python3-pyserial \
    python3-modules \
    xenbridge \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    "

IMAGE_LINGUAS = " "

LICENSE = "MIT"

inherit core-image

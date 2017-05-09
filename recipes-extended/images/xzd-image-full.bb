DESCRIPTION = "A Full XZD image (Xen + Full Petalinux)"

require recipes-core/images/petalinux-image-common.inc

ZYNQ_FEATURES = " \
    dev-pkgs \
    package-management \
    ptest-pkgs \
    splash \
    tools-debug \
    tools-profile \
    tools-sdk \
    tools-testapps \
    petalinux-base \
    petalinux-self-hosted \
    petalinux-qt \
    petalinux-opencv \
    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'petalinux-x11', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'openamp', 'petalinux-openamp', '', d)} \
    "

ZYNQMP_FEATURES = " \
    petalinux-benchmarks \
    petalinux-gstreamer \
    petalinux-audio \
    hwcodecs \
    ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'petalinux-xen', '', d)} \
    "

IMAGE_FEATURES_append_zynqmp = " ${ZYNQ_FEATURES} ${ZYNQMP_FEATURES}"

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

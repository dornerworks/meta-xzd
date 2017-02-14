require recipes-bsp/u-boot/u-boot.inc

DEPENDS += "dtc-native"

SRCREV = "dw-v2016.3"

UBOOT_REL="2016.07-dw"

PV = "${UBOOT_REL}+git${SRCPV}"

S = "${WORKDIR}/git"

SRC_URI = " \
    git://github.com/dornerworks/u-boot-xlnx.git;protocol=https;branch=${SRCREV} \
    "

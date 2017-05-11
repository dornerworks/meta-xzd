require recipes-bsp/u-boot/u-boot.inc

DEPENDS += "dtc-native"

SRCREV = "dw-v2017.1"

UBOOT_REL="2017.01-dw"

PV = "${UBOOT_REL}+git${SRCPV}"

S = "${WORKDIR}/git"

SRC_URI = " \
    git://github.com/dornerworks/u-boot-xlnx.git;protocol=https;branch=${SRCREV} \
    "

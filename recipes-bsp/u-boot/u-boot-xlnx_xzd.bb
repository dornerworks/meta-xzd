require recipes-bsp/u-boot/u-boot.inc

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

DEPENDS += "dtc-native"

SRCREV = "${AUTOREV}"

UBOOT_REL="2017.01-dw"

PV = "${UBOOT_REL}+git${SRCPV}"

S = "${WORKDIR}/git"

SRC_URI = " \
    git://github.com/dornerworks/u-boot-xlnx.git;protocol=https;branch=dw-v2017.3 \
    "

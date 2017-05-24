DESCRIPTION = "Script to create Xen bridge"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

FILESEXTRAPATHS_prepend := "${THISDIR}/scripts:"

SRC_URI = " \
    file://xenbr0 \
    file://xenbridge \
    "

INITSCRIPT_NAME = "xenbridge"
INITSCRIPT_PARAMS = "defaults 85"

inherit update-rc.d

do_install () {
   install -d ${D}${sysconfdir}/network/if-pre-up.d/
   install -m 0755 ${WORKDIR}/xenbr0 ${D}${sysconfdir}/network/if-pre-up.d/xenbr0

   install -d ${D}${sysconfdir}/init.d/
   install -m 0755 ${WORKDIR}/xenbridge ${D}${sysconfdir}/init.d/xenbridge
}

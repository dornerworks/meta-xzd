DESCRIPTION = "Overlay Filesystem Startup Script"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

FILESEXTRAPATHS_prepend := "${THISDIR}/scripts:"

SRC_URI = " \
    file://overlay_fs \
    "

do_install () {
   install -d ${D}${sysconfdir}/init.d/
   install -m 0755 ${WORKDIR}/overlay_fs ${D}${sysconfdir}/init.d/xzd_overlay_fs

   install -d ${D}${sysconfdir}/rcS.d/
   ln -sf ../init.d/xzd_overlay_fs ${D}${sysconfdir}/rcS.d/S45xzd_overlay_fs
}

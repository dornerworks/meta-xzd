SUMMARY = "Copy UltraZed system-wrapper.bit FPGA image to deploy directory for BOOT.bin creation."
LICENSE = "GPLv2"
S = "${WORKDIR}"
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
LIC_FILES_CHKSUM = "file://ultrazed-system_wrapper.bit;md5=f56e783177f32c8d40a51eb8dca342e8"

SRC_URI = "file://ultrazed-system_wrapper.bit"

COMPATIBLE_MACHINE = "ultrazed-zynqmp"
PROVIDES = "virtual/bitstream"

#This package doesn't have any files for the rootfs in it, option needed to create an empty
# package so when the rootfs image is made it finds the ultrazed-bit_xxx.deb package and doesn't complain
FILES_${PN} = ""
ALLOW_EMPTY_${PN} = "1"


# Copy script to the deploy area
do_deploy () {
   install -d ${DEPLOY_DIR_IMAGE}
   install -m 0755 ${WORKDIR}/ultrazed-system_wrapper.bit ${DEPLOY_DIR_IMAGE}/${MACHINE}.bit
}
addtask deploy after do_install

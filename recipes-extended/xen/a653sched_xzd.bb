DESCRIPTION = "Xen ARINC653 Scheduling Utility"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

INSANE_SKIP_${PN} = "ldflags"
INSANE_SKIP_${PN}-dev = "ldflags"

SRCREV = "bitbake"
SRC_URI = "git://github.com/dornerworks/a653_sched.git;protocol=https;branch=${SRCREV}"

S = "${WORKDIR}/git"

DEPENDS = "util-linux xen"

do_compile() {
   make
}

FILES_${PN} = "/root/a653_sched"

do_install() {
   install -d ${D}/root
   install -m 0755 ${S}/a653_sched ${D}/root/a653_sched
}

require recipes-extended/xen/xen.inc

SRCREV = "dw-v2016.4"

XEN_REL="4.7-dw"

PV = "${XEN_REL}+git${SRCPV}"

S = "${WORKDIR}/git"

SRC_URI = " \
    git://github.com/dornerworks/xen.git;protocol=https;branch=${SRCREV} \
    "

DEPENDS += "u-boot-mkimage-native"

EXTRA_OEMAKE += 'CROSS_COMPILE=${TARGET_PREFIX}'

# Need to enable debugging, so guests can use the hypervisor console.
# Should be disabled if security is a concern.
EXTRA_OEMAKE := "${@'${EXTRA_OEMAKE}'.replace('debug=n', 'debug=y')}"

XENIMAGE_KERNEL_LOADADDRESS ?= "0x5000000"

do_deploy_append() {
    if [ -f ${DEPLOYDIR}/xen-${MACHINE} ]; then
        uboot-mkimage -A arm64 -T kernel \
        -a ${XENIMAGE_KERNEL_LOADADDRESS} \
        -e ${XENIMAGE_KERNEL_LOADADDRESS} \
        -C none \
        -d ${DEPLOYDIR}/xen-${MACHINE} ${DEPLOYDIR}/xen.ub
    fi
}

PACKAGES += "${PN}-vchan-example"

FILES_${PN}-vchan-example = "\
    /root/libvchan-example/vchan-node1 \
    /root/libvchan-example/vchan-node2 \
    "

do_install_append() {
    install -d ${D}/root/libvchan-example/
    install -m 0755 ${S}/tools/libvchan/vchan-node1 \
            ${D}/root/libvchan-example/vchan-node1
    install -m 0755 ${S}/tools/libvchan/vchan-node2 \
            ${D}/root/libvchan-example/vchan-node2
}

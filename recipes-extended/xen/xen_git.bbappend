FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://arm64_defconfig \
    file://0001-Check-zone-before-merging-adjacent-blocks-in-heap.patch \
    file://0002-platforms-zynqmp-Mediate-EEMI-calls-for-TCM.patch \
    file://0003-Added-simple-boot-traces-to-Xen.patch \
    file://0004-Added-Counter-Timestamp-before-a-guest-is-created.patch \
    "

DEPENDS += "u-boot-mkimage-native"

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

do_configure_prepend() {
    cp "${WORKDIR}/arm64_defconfig" "${B}/xen/arch/arm/configs/arm64_defconfig" || \
    bbfatal "Unable to copy arm64_defconfig to xen arm64_defconfig"
}

do_install_append() {
    install -d ${D}/root/libvchan-example/
    install -m 0755 ${S}/tools/libvchan/vchan-node1 \
            ${D}/root/libvchan-example/vchan-node1
    install -m 0755 ${S}/tools/libvchan/vchan-node2 \
            ${D}/root/libvchan-example/vchan-node2
}

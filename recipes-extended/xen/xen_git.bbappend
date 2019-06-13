FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://arm64_defconfig \
    file://0001-Check-zone-before-merging-adjacent-blocks-in-heap.patch \
    file://0002-platforms-zynqmp-Mediate-EEMI-calls-for-TCM.patch \
    file://0003-Added-simple-boot-traces-to-Xen.patch \
    file://0004-Added-Counter-Timestamp-before-a-guest-is-created.patch \
    file://0005-IRQ-latency-measurement.patch \
    file://0006-xen-arm-gic-vgic-Fix-the-assert-condition-in-vgic_co.patch \
    "

DEPENDS += "u-boot-mkimage-native"

XENIMAGE_KERNEL_LOADADDRESS = "0x80000"

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

# Device tree appends
SRC_URI_append_zcu102-zynqmp = " file://xen-zcu102.dts;subdir=git/arch/${ARCH}/boot/dts/xilinx \
                                 file://xen-zcu102-enet_pt.dts;subdir=git/arch/${ARCH}/boot/dts/xilinx"

SRC_URI_append_ultrazed-zynqmp = " file://xen-ultrazed.dts;subdir=git/arch/${ARCH}/boot/dts/xilinx \
                                   file://xen-ultrazed-enet_pt.dts;subdir=git/arch/${ARCH}/boot/dts/xilinx"

FILESEXTRAPATHS_prepend_zynqmp := "${THISDIR}/dts:"

PACKAGE_ARCH = "${MACHINE_ARCH}"

KERNEL_DEVICETREE_append_zcu102-zynqmp = " xilinx/xen-zcu102.dtb \
                                           xilinx/xen-zcu102-enet_pt.dtb"

KERNEL_DEVICETREE_append_ultrazed-zynqmp = " xilinx/xen-ultrazed.dtb \
                                             xilinx/xen-ultrazed-enet_pt.dtb"

RPROVIDES_kernel-image += "kernel-module-xen-gntalloc"
RPROVIDES_kernel-image += "kernel-module-xen-gntdev"

# Config fragments
FILESEXTRAPATHS_prepend := "${THISDIR}/config:"

SRC_URI += "file://network_bridge.scc"
SRC_URI += "file://filesystem_overlay.scc"
SRC_URI += "file://version.scc"
SRC_URI += "file://cma_size.scc"

LINUX_VERSION_EXTENSION = "-dw"
do_compile[depends] += "device-tree-generation:do_deploy"

S1 = "${S}/arch/${ARCH}/boot/dts/xilinx/dtg/system-top.dts"
D1_append_zcu102-zynqmp = "${S}/arch/${ARCH}/boot/dts/xilinx/xen-zcu102.dts"

do_compile_prepend_zcu102-zynqmp() {
    mkdir -p ${S}/arch/${ARCH}/boot/dts/xilinx/dtg
    install -m 0644 ${DEPLOY_DIR_IMAGE}/dtg/*.dtsi  ${S}/arch/${ARCH}/boot/dts/xilinx/dtg/
    install -m 0644 ${DEPLOY_DIR_IMAGE}/dtg/system-top.dts  ${S}/arch/${ARCH}/boot/dts/xilinx/dtg/
    sed -i "s/serial[0-9]/serialN/g" ${D1}
    sed -i "s/serialN/$(grep -oP  'serial\d(?= .*uart0)' ${S1})/g" ${D1}

}

# Debug file additions
do_deploy_prepend() {
	install -m 0644 System.map ${DEPLOYDIR}/System.map-${KERNEL_IMAGE_BASE_NAME}
	install -m 0644 vmlinux ${DEPLOYDIR}/vmlinux-${KERNEL_IMAGE_BASE_NAME}.elf
}

do_deploy_append() {
	cd ${DEPLOYDIR}
	ln -sf vmlinux-${KERNEL_IMAGE_BASE_NAME}.elf vmlinux
	ln -sf System.map-${KERNEL_IMAGE_BASE_NAME} System.map.linux
}



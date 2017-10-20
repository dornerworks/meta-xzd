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

# Config fragments
FILESEXTRAPATHS_prepend := "${THISDIR}/config:"

SRC_URI += "file://xen_gnt.scc"
SRC_URI += "file://network_bridge.scc"
SRC_URI += "file://filesystem_overlay.scc"
SRC_URI += "file://version.scc"

LINUX_VERSION_EXTENSION = "-dw"

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

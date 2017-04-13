SRC_URI += "file://xen-zcu102.dts;subdir=git/arch/${ARCH}/boot/dts/xilinx \
            file://xen-zcu102-enet_pt.dts;subdir=git/arch/${ARCH}/boot/dts/xilinx"

FILESEXTRAPATHS_prepend_zynqmp := "${THISDIR}/dts:"

PACKAGE_ARCH = "${MACHINE_ARCH}"

KERNEL_DEVICETREE += "xilinx/xen-zcu102.dtb \
                      xilinx/xen-zcu102-enet_pt.dtb"

do_deploy_prepend() {
	install -m 0644 System.map ${DEPLOYDIR}/System.map-${KERNEL_VERSION}
	install -m 0644 vmlinux ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.elf
}

do_deploy_append() {
	ln -sf ${KERNEL_IMAGE_BASE_NAME}.elf vmlinux
  	ln -sf System.map-${KERNEL_VERSION} System.map.linux
}
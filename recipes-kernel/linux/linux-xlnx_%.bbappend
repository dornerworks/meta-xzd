SRC_URI += "file://xen-zcu102.dts;subdir=git/arch/${ARCH}/boot/dts/xilinx \
            file://xen-zcu102-enet_pt.dts;subdir=git/arch/${ARCH}/boot/dts/xilinx"

FILESEXTRAPATHS_prepend_zynqmp := "${THISDIR}/dts:"

PACKAGE_ARCH = "${MACHINE_ARCH}"

KERNEL_DEVICETREE += "xilinx/xen-zcu102.dtb \
                      xilinx/xen-zcu102-enet_pt.dtb"
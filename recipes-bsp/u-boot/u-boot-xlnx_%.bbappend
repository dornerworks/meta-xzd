FILESEXTRAPATHS_prepend := "${THISDIR}/configs:"

SRC_URI += " \
	file://config.cfg \
	"

DTB_NAME_zcu102-zynqmp = "xen-zcu102.dtb"
DTB_NAME_ultrazed-zynqmp = "xen-ultrazed.dtb"

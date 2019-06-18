FILESEXTRAPATHS_prepend := "${THISDIR}/configs:"

SRC_URI += " \
	file://config.cfg \
	"

SRC_URI_append_ultrazed-zynqmp = " \
	file://ultrazed.cfg \
	"

DTB_NAME_zcu102-zynqmp = "xen-zcu102.dtb"
DTB_NAME_ultrazed-zynqmp = "xen-ultrazed.dtb"

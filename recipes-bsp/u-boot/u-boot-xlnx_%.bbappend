FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
FILESEXTRAPATHS_prepend := "${THISDIR}/configs:"

SRC_URI += " \
	file://config.cfg \
	file://0001-i2c-muxes-pca954x-clarify-enable-field.patch \
	file://0002-i2c-muxes-pca954x-support-PCA9543-I2C-switch.patch \
	"

SRC_URI_append_ultrazed-zynqmp = " \
	file://ultrazed.cfg \
	"

DTB_NAME_zcu102-zynqmp = "xen-zcu102.dtb"
DTB_NAME_ultrazed-zynqmp = "xen-ultrazed.dtb"

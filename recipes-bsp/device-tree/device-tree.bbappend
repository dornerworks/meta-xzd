FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append_zcu102-zynqmp = " \
	file://xen-zcu102.dts \
	file://xen-zcu102-enet_pt.dts \
	file://0001-BOARD-zcu102-Fix-the-compatible-string-for-eeprom.patch \
	"

SRC_URI_append_ultrazed-zynqmp = " \
	file://xen-ultrazed.dts \
	file://xen-ultrazed-enet_pt.dts \
	"

do_configure_append() {
	cp ${WORKDIR}/*.dts ${DT_FILES_PATH}/
}

do_deploy() {
	for DTB_FILE in `ls *.dtb *.dtbo`; do
		install -Dm 0644 ${B}/${DTB_FILE} ${DEPLOYDIR}/${DTB_BASE_NAME}-${DTB_FILE}
		ln -sf ${DTB_BASE_NAME}-${DTB_FILE} ${DEPLOYDIR}/${MACHINE}-${DTB_FILE}
		ln -sf ${DTB_BASE_NAME}-${DTB_FILE} ${DEPLOYDIR}/${DTB_FILE}
	done

	ln -sf ${DTB_BASE_NAME}-system-top.dtb ${DEPLOYDIR}/${MACHINE}-system.dtb
	ln -sf ${DTB_BASE_NAME}-system-top.dtb ${DEPLOYDIR}/system.dtb
}

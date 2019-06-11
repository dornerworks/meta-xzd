RPROVIDES_kernel-image += "kernel-module-xen-gntalloc"
RPROVIDES_kernel-image += "kernel-module-xen-gntdev"

# Config fragments
FILESEXTRAPATHS_prepend := "${THISDIR}/config:"

SRC_URI += "file://network_bridge.scc"
SRC_URI += "file://filesystem_overlay.scc"
SRC_URI += "file://version.scc"
SRC_URI += "file://cma_size.scc"

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

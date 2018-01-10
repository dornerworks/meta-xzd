include xzd-image-minimal.bb

DESCRIPTION = "A minimal XZD (Xen + Petalinux) initramfs image"

IMAGE_INSTALL += " \
    overlay-fs \
    "
RDEPENDS_remove = "kernel-module-xen-gntalloc"
RDEPENDS_remove = "kernel-module-xen-gntdev"
    
IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"

# Put everything in initramfs
PACKAGE_INSTALL = "${IMAGE_INSTALL} ${FEATURE_INSTALL} ${FEATURE_INSTALL_OPTIONAL}"

include xzd-image-minimal.bb

DESCRIPTION = "A minimal XZD (Xen + Petalinux) initramfs image"

IMAGE_INSTALL += " \
    overlay-fs \
    "

IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"

# Put everything in initramfs
PACKAGE_INSTALL = "${IMAGE_INSTALL}"

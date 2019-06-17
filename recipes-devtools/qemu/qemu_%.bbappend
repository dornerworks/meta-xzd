# The qemu recipes will by default install qemu for many different
# architectures, thereby bloating the rootfs. Xen on aarch64 only uses
# qemu-system-i386, so we can get rid of all other qemu targets.

QEMU_TARGETS_zynqmp = "i386"

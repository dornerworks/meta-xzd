DESCRIPTION = "A minimal XZD image (Xen + Petalinux)"

IMAGE_INSTALL += " \
    packagegroup-core-boot \
    packagegroup-core-ssh-dropbear \
    ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', 'kernel-module-xen-acpi-processor', '', d)} \
    kernel-module-xen-blkback \
    kernel-module-xen-gntalloc \
    kernel-module-xen-gntdev \
    kernel-module-xen-netback \
    ${@bb.utils.contains('MACHINE_FEATURES', 'pci', 'kernel-module-xen-pciback', '', d)} \
    kernel-module-xen-wdt \
    xen-base \
    qemu \
    openssh-sftp-server \
    tcf-agent \
    mtd-utils \
    bridge-utils \
    canutils \
    pciutils \
    kernel-modules \
    iperf3 \
    python3 \
    python3-pyserial \
    python3-importlib \
    "

IMAGE_LINGUAS = " "

LICENSE = "MIT"

inherit core-image
DESCRIPTION = "A minimal XZD image (Xen + Petalinux)"

IMAGE_INSTALL += " \
    packagegroup-core-boot \
    packagegroup-core-ssh-dropbear \
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
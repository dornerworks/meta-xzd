DESCRIPTION = "A minimal XZD image (Xen + Petalinux)"

IMAGE_FEATURES += "petalinux-xen"

IMAGE_INSTALL += " \
    packagegroup-core-boot \
    packagegroup-core-ssh-dropbear \
    xen-xenstat \
    xen-vchan-example \
    openssh-sftp-server \
    mtd-utils \
    bridge-utils \
    canutils \
    pciutils \
    kernel-modules \
    iperf3 \
    python3 \
    python3-pyserial \
    python3-importlib \
    python3-modules \
    xenbridge \
    "

IMAGE_LINGUAS = " "

LICENSE = "MIT"

inherit core-image

# meta-xzd

This layer provides support for the Virtuosity distribution (formally Xen Xilinx Distribution) for Xilinx devices.

## Supported architecture

Boards Supported by this layer:
    * Xilinx ZynqMP architecture

## Dependencies

This layer depends on:

    URI: git://github.com/xilinx/yocto-scripts
    URI: git://github.com/xilinx/yocto-manifests
    URI: git://github.com/xilinx/meta-xilinx
    URI: git://github.com/xilinx/meta-xilinx-tools
    URI: git://github.com/xilinx/meta-petalinux
    URI: git://github.com/xilinx/poky
    URI: git://github.com/xilinx/meta-mingw
    URI: git://github.com/xilinx/meta-openamp
    URI: git://github.com/xilinx/meta-browser
    URI: git://github.com/xilinx/meta-openembedded
    URI: git://github.com/xilinx/meta-qt5
    URI: git://github.com/xilinx/meta-linaro
    URI: git://github.com/xilinx/meta-virtualization


# Build Instructions

1. Initialize a build using the 'oe-init-build-env' script in yocto. Once
initialized configure bblayers.conf by adding the 'meta-xzd layer. e.g.:

    BBLAYERS ?= " \
        /host/sources/core/meta \
        /host/sources/core/meta-poky \
        /host/sources/core/../meta-openembedded/meta-perl \
        /host/sources/core/../meta-openembedded/meta-python \
        /host/sources/core/../meta-openembedded/meta-filesystems \
        /host/sources/core/../meta-openembedded/meta-gnome \
        /host/sources/core/../meta-openembedded/meta-multimedia \
        /host/sources/core/../meta-openembedded/meta-networking \
        /host/sources/core/../meta-openembedded/meta-webserver \
        /host/sources/core/../meta-openembedded/meta-xfce \
        /host/sources/core/../meta-openembedded/meta-initramfs \
        /host/sources/core/../meta-openembedded/meta-oe \
        /host/sources/core/../meta-browser \
        /host/sources/core/../meta-qt5 \
        /host/sources/core/../meta-xilinx/meta-xilinx-bsp \
        /host/sources/core/../meta-xilinx/meta-xilinx-contrib \
        /host/sources/core/../meta-xilinx-tools \
        /host/sources/core/../meta-petalinux \
        /host/sources/core/../meta-virtualization \
        /host/sources/core/../meta-openamp \
        /host/sources/core/../meta-xzd \
    "

2.  Build the target file system image using bitbake:

        bitbake xzd-image-minimal

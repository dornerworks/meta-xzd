# meta-xzd

This layer provides support for the Xen Xilinx Distribution (XZD) for Xilinx devices.

## Supported architecture


Boards Supported by this layer:
	* Xilinx ZynqMP architecture

## Forum

Participate in the forums at

http://xzdforums.dornerworks.com/

This forum is used for questions and/or comments on XZD.

## Dependencies

This layer depends on:

    URI: git://git.openembedded.org/bitbake
	URI: git://git.openembedded.org/openembedded-core
	URI: git://git.openembedded.org/meta-openembedded
	URI: git://git.openembedded.org/meta-qt5
	URI: git://git.openembedded.org/meta-xilinx
	URI: git://git.openembedded.org/meta-xilinx-tools
    URI: git://git.openembedded.org/meta-petalinux
    URI: git://git.openembedded.org/meta-virtualization

# Build Instructions

1. Initialize a build using the 'oe-init-build-env' script in yocto. Once
initialized configure bblayers.conf by adding the 'meta-xzd layer. e.g.:

        BBLAYERS ?= " \
		    <path to layer>/meta-openembedded/meta-perl \
		    <path to layer>/meta-openembedded/meta-systemd \
		    <path to layer>/meta-openembedded/meta-gpe \
		    <path to layer>/meta-openembedded/meta-python \
		    <path to layer>/meta-openembedded/meta-efl \
		    <path to layer>/meta-openembedded/meta-ruby \
		    <path to layer>/meta-openembedded/meta-filesystems \
		    <path to layer>/meta-openembedded/meta-gnome \
		    <path to layer>/meta-openembedded/meta-multimedia \
		    <path to layer>/meta-openembedded/meta-networking \
		    <path to layer>/meta-openembedded/meta-webserver \
		    <path to layer>/meta-openembedded/meta-xfce \
		    <path to layer>/meta-openembedded/meta-initramfs \
		    <path to layer>/meta-openembedded/meta-oe \
		    <path to layer>/meta \
		    <path to layer>/meta-qt5 \
		    <path to layer>/meta-selftest \
		    <path to layer>/meta-skeleton \
		    <path to layer>/meta-xilinx \
		    <path to layer>/meta-xilinx-tools \
		    <path to layer>/meta-petalinux \
            <path to layer>/meta-virtualization \
            <path to layer>/meta-xzd \
		    "

2.  Build the target file system image using bitbake:

	    bitbake xzd-image-minimal

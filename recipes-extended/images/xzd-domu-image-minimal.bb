DESCRIPTION = "A XZD domU image."

inherit core-image

IMAGE_INSTALL += " \
    packagegroup-core-boot \
    ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', 'kernel-module-xen-acpi-processor', '', d)} \
    kernel-module-xen-gntdev \
    kernel-module-xen-gntalloc \
    "

LICENSE = "MIT"

# Send console messages to xen console
APPEND += "console=hvc0"

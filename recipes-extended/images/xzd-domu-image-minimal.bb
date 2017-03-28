DESCRIPTION = "A XZD domU image."

inherit core-image

IMAGE_INSTALL += " \
    packagegroup-core-boot \
    ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', 'kernel-module-xen-acpi-processor', '', d)} \
    "

LICENSE = "MIT"

# Send console messages to xen console
APPEND += "console=hvc0"
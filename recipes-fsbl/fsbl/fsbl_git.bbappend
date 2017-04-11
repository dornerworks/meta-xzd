FILESEXTRAPATHS_prepend := "${THISDIR}/patches:"
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-Enable-GEM-Virtualization-Passthrough.patch"

do_configure_prepend() {
     rm -rf ${S}/.pc
}

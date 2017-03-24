do_install_append () {
   install -d ${D}${bindir}
   ln -sf /usr/bin/python3.5 ${D}${bindir}/python3.4
}


SRC_URI += " \
	   file://chrony.conf \
	   file://chronyd \
	   "

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

do_install:append() {
	install -d ${D}/etc/rcS.d
	install -D -m 0755 ${WORKDIR}/chronyd ${D}/etc/init.d/chronyd
	install -m 0644 ${WORKDIR}/chrony.conf ${D}/etc
	ln -s -r ${D}/etc/init.d/chronyd ${D}/etc/rcS.d/S49chronyd
}

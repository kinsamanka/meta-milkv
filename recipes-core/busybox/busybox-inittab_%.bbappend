SRC_URI += "file://inittab"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

do_install:append() {
	rm -rf ${D}/etc/inittab
	install -D -m 0644 ${WORKDIR}/inittab ${D}/etc
}

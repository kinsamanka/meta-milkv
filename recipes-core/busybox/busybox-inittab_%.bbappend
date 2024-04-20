SRC_URI += "file://inittab"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

do_install:append() {
	install -C -m 0644 ${WORKDIR}/inittab ${D}/etc
}

SRC_URI += "file://fstab"
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

do_install:append() {
	install -D -m 0644 ${WORKDIR}/fstab ${D}/etc
}

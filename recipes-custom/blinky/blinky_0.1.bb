SUMMARY = "blinky app"
SECTION = "custom"
DESCRIPTION = "Blink onboard led using the secodary processor"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

PR = "0.1"

SRC_URI += " \
	   file://blinky.elf \
	   file://rpmsg.elf \
	   file://rproc \
	   "

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
FILES:${PN} = "${base_libdir}/firmware /etc/init.d /etc/rc5.d /etc/rc6.d"

do_install() {
        install -D -m 0644 ${WORKDIR}/blinky.elf ${D}/lib/firmware/blinky.elf
        install -m 0644 ${WORKDIR}/rpmsg.elf ${D}/lib/firmware
        install -D -m 0755 ${WORKDIR}/rproc ${D}/etc/init.d/rproc

	install -d ${D}/etc/rc5.d
	install -d ${D}/etc/rc6.d

	ln -s -r ${D}/etc/init.d/rproc ${D}/etc/rc5.d/S99rproc
	ln -s -r ${D}/etc/init.d/rproc ${D}/etc/rc6.d/K01rproc
}

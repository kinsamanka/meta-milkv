SUMMARY = "blinky app"
SECTION = "custom"
DESCRIPTION = "Blink onboard led using the secodary processor"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

PR = "0.2"

DEPENDS = "zephyr-blinky"

SRC_URI += "file://rproc"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
FILES:${PN} = "${base_libdir}/firmware /etc/init.d /etc/rc5.d /etc/rc6.d"

do_install() {
        install -D -m 0644 ${STAGING_DIR_TARGET}/firmware/zephyr-blinky.elf ${D}/lib/firmware/blinky.elf
        install -D -m 0755 ${WORKDIR}/rproc ${D}/etc/init.d/rproc

	install -d ${D}/etc/rc5.d
	install -d ${D}/etc/rc6.d

	ln -s -r ${D}/etc/init.d/rproc ${D}/etc/rc5.d/S99rproc
	ln -s -r ${D}/etc/init.d/rproc ${D}/etc/rc6.d/K01rproc
}

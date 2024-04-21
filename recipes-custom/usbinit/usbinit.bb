DESCRIPTION = "Milk-V Duo usb init script"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"  

PR = "0.1"

SRC_URI += "file://usbinit"

do_install:append() {
	install -d ${D}/etc/rcS.d
	install -D -m 0755 ${WORKDIR}/usbinit ${D}/etc/init.d/usbinit
	ln -s -r ${D}/etc/init.d/usbinit ${D}/etc/rcS.d/S30usbinit
}

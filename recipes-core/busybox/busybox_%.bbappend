do_install:append() {
	install -d ${D}/etc/rcS.d
	install -d ${D}/etc/rc6.d

	ln -s -r ${D}/etc/init.d/syslog ${D}/etc/rcS.d/S01syslog
	ln -s -r ${D}/etc/init.d/syslog ${D}/etc/rc6.d/K99syslog
	ln -s -r ${D}/etc/init.d/networking ${D}/etc/rcS.d/S40network
	ln -s -r ${D}/etc/init.d/networking ${D}/etc/rc6.d/K60network
	ln -s -r ${D}/etc/init.d/dropbear ${D}/etc/rcS.d/S50dropbear
	ln -s -r ${D}/etc/init.d/dropbear ${D}/etc/rc6.d/K50dropbear
}

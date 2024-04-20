SRC_URI += "file://interfaces file://udhcpd.conf"
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

do_install:append() {
        install -D -m 0644 ${WORKDIR}/interfaces ${D}/etc/network
        install -C -m 0644 ${WORKDIR}/udhcpd.conf ${D}/etc
}


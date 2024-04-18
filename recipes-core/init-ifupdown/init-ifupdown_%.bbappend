SRC_URI += "file://interfaces"
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

do_install:append() {
        install -D -m 0644 ${WORKDIR}/interfaces ${D}/etc/network
}


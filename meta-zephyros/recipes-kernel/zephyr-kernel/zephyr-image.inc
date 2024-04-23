require zephyr-kernel-src.inc
require zephyr-kernel-common.inc
inherit deploy

OECMAKE_SOURCEPATH = "${ZEPHYR_SRC_DIR}"

do_install() {
    install -d ${D}/firmware

    install -D ${B}/zephyr/${ZEPHYR_MAKE_OUTPUT} ${D}/firmware/${PN}.elf

    if [ -f ${B}/zephyr/${ZEPHYR_MAKE_BIN_OUTPUT} ]
    then
      install -D ${B}/zephyr/${ZEPHYR_MAKE_BIN_OUTPUT} ${D}/firmware/${PN}.bin
    fi

    if [ -f ${B}/zephyr/${ZEPHYR_MAKE_EFI_OUTPUT} ]
    then
      install -D ${B}/zephyr/${ZEPHYR_MAKE_EFI_OUTPUT} ${D}/firmware/${PN}.efi
    fi
}
FILES:${PN} = "/firmware"
INSANE_SKIP += "ldflags buildpaths"
SYSROOT_DIRS += "/firmware"

do_deploy() {
    cp ${D}/firmware/${PN}.* ${DEPLOYDIR}/
}
addtask deploy after do_install

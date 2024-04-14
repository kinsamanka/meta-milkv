FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRCREV = "v1.4"

SRC_URI:milkv-duo = "git://github.com/riscv-software-src/opensbi.git;branch=master;protocol=https"

EXTRA_OEMAKE:append = " FW_FDT_PATH=${DEPLOY_DIR_IMAGE}/u-boot.dtb"

do_compile[depends] += "u-boot:do_deploy"

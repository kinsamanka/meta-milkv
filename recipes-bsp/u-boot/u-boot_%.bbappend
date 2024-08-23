FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:milkv-duo += " \
                      file://0001-skip-cvitek-board-init.patch \
                      file://0002-Add-milkv-boards-support.patch \
                     "

UBOOT_MACHINE:milkv-duo = "${MACHINE}_defconfig"

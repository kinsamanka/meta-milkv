SRC_URI = "git://github.com/${FORK}/cvitek-linux-5.10.git;protocol=https;branch=${BRANCH} \
           file://milkv_defconfig \
           file://${_board}_sd_defconfig \
           file://0001-Add-Milk-V-Duo-S-and-Milk-V-Duo-256M-dts.patch \
           file://0002-dts-fix-cells-sizes.patch \
           file://0003-dts-add-pinctrl.patch \
           file://0004-dts-add-gpio-leds.patch \
           file://gpio-class.cfg \
           file://pinctrl.cfg \
           "

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

_board = "${@'${MACHINE}'.replace('-', '_')}"
_BOARD = "${@'${_board}'.upper()}"

KERNEL_EXTRA_ARGS = "KCFLAGS=-DBOARD_${_BOARD}"

KERNEL_DEVICETREE = "cvitek/${_board}_sd.dtb"

do_configure:append() {
       sed -i "2 i #define BOARD_${_BOARD}" ${S}/arch/riscv/boot/dts/cvitek/${_board}_sd.dts
}

COMPATIBLE_MACHINE = "milkv-(duo|duo256m|duos)"

SRCREV = "15ea08f842174c4eff8dcc0943de6e70b0b7aa2f"

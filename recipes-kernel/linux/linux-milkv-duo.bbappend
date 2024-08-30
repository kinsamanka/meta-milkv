SRC_URI:append = " \
		 file://milkv-duo_defconfig \
		 file://riscv-Add-pinctrl-for-Sophgo-CV1800-series-SoC.patch \
		 file://riscv-sophgo-add-clock-support-for-Sophgo-CV1800-SG2.patch \
		 file://riscv-dts-sophgo-cv18xx-Add-spi-i2c-devices.patch \
		 file://riscv-dts-sophgo-cv18xx-add-DMA-controller.patch \
		 file://dt-bindings-usb-dwc2-Add-support-for-Sophgo-CV18XX-S.patch \
		 file://dt-bindings-riscv-add-Milk-V-Duo-S-board-compatibles.patch \
		 file://dt-fix-MilkV-Duo-S.patch \
		 file://dt-use-real-clock.patch \
		 file://dt-add-Milk-V-Duo-256M.patch \
		 file://dt-bindings-phy-Add-Sophgo-CV1800-USB-phy.patch \
		 file://dt-enable-usb.patch \
		 file://dt-add-gpio-led.patch \
		 "

FILESEXTRAPATHS:prepend := "${THISDIR}/linux-milkv-duo:"

KERNEL_DEVICETREE:milkv-duo = "${_DT}"

python() {
    s = "sophgo/cv1800b-milkv-duo.dtb"
    m = d.getVar("MACHINE")
    if m == "milkv-duos":
        s = "sophgo/cv1812h-milkv-duo-s.dtb"
    elif m == "milkv-duo256m":
        s = "sophgo/cv1812h-milkv-duo-256m.dtb"
    d.setVar("_DT", s)
}

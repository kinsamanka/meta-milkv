require recipes-kernel/linux/linux-mainline-common.inc

SUMMARY = "Milk-V Duo mainline kernel recipe"

LINUX_VERSION ?= "6.8+"
KERNEL_VERSION_SANITY_SKIP="1"
PV = "${LINUX_VERSION}+git${SRCPV}"

BRANCH = "linux-5.10.y"
SRCREV = "v5.10.215"
SRCPV = "${@bb.fetch2.get_srcrev(d)}"
SRC_URI = " \
	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git;branch=${BRANCH} \
	file://0001-linux-port-cvitek-asic-chips.patch \
	file://0002-add-support-for-milkv-duo-board.patch \
	file://0003-add-dts.patch \
	file://v5_10_y_defconfig \
	file://multi.its \
"

FILESEXTRAPATHS:prepend := "${THISDIR}/linux-milkv-duo:"

KERNEL_DEVICETREE ?= "cvitek/cv1800b_milkv_duo_sd.dtb"

DEPENDS = "u-boot-mkimage-native dtc-native"

do_deploy[depends] = "milkv-duo-fsbl:do_deploy"

do_deploy:append() {
	cp ${B}/arch/riscv/boot/Image.gz ${B}
	cp ${WORKDIR}/multi.its ${B}
	mkimage -f ${B}/multi.its ${B}/uImage.fit
	install -m 744 ${B}/uImage.fit ${DEPLOYDIR}
	install -m 744 ${B}/arch/riscv/boot/dts/${KERNEL_DEVICETREE} ${DEPLOYDIR}/default.dtb
}

COMPATIBLE_MACHINE = "milkv-duo"

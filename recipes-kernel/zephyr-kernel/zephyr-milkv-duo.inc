include recipes-kernel/zephyr-kernel/zephyr-sample.inc

LICENSE = "Apache-2.0"

DEPENDS:append = " dtc-native"

SRCREV_milkv = "master"
SRC_URI_MILKV_DUO ?= "git://github.com/kinsamanka/milkv-zephyros.git;protocol=https"

SRC_URI = "\
	${SRC_URI_ZEPHYR};branch=${ZEPHYR_BRANCH};name=default;destsuffix=git/zephyr \
	${SRC_URI_MILKV_DUO};branch=${SRCREV_milkv};name=milkv;destsuffix=git/milkv_duo \
	"

ZEPHYR_EXTRA_MODULES = "${S}/milkv_duo/drivers"
EXTRA_OECMAKE:append = " -DEXTRA_CPPFLAGS='-march=rv64gc -mabi=lp64d'"

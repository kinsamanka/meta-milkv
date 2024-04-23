include zephyr-sample.inc

SRCREV_milkv = "master"
SRC_URI_MILKV_DUO ?= "git://github.com/kinsamanka/milkv-zephyros.git;protocol=https"
SRC_URI += " ${SRC_URI_MILKV_DUO};branch=${SRCREV_milkv};name=milkv;destsuffix=git/milkv_duo"

DEPENDS:append = " dtc-native"

EXTRA_OECMAKE:append = " \
	-DZEPHYR_EXTRA_MODULES=${S}/milkv_duo/drivers \
	-DBOARD_ROOT=${S}/milkv_duo \
	-DSOC__ROOT=${S}/milkv_duo \
	-DDTS_ROOT=${S}/milkv_duo \
	-DEXTRA_CPPFLAGS='-march=rv64gc -mabi=lp64d' \
	"

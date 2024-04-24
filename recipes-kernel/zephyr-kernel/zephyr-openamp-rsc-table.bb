include zephyr-milkv-duo.inc

SRC_URI += "\
	${SRC_URI_ZEPHYR_LIBMETAL};name=libmetal;nobranch=1;destsuffix=git/modules/hal/libmetal \
	${SRC_URI_ZEPHYR_OPEN_AMP};name=open-amp;nobranch=1;destsuffix=git/modules/lib/open-amp \
	"

ZEPHYR_SRC_DIR = "${S}/milkv_duo/openamp"

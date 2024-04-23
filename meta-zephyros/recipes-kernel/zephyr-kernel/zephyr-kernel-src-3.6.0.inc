# Auto-generated from zephyr-kernel-src.inc.jinja

SRCREV_FORMAT = "default"

SRCREV_default = "468eb56cf242eedba62006ee758700ee6148763f"
SRCREV_libmetal = "243eed541b9c211a2ce8841c788e62ddce84425e"
SRCREV_open-amp = "da78aea63159771956fe0c9263f2e6985b66e9d5"

SRC_URI_ZEPHYR ?= "git://github.com/zephyrproject-rtos/zephyr.git;protocol=https"
SRC_URI_ZEPHYR_LIBMETAL ?= "git://github.com/zephyrproject-rtos/libmetal;protocol=https"
SRC_URI_ZEPHYR_OPEN_AMP ?= "git://github.com/zephyrproject-rtos/open-amp;protocol=https"


SRC_URI = "\
    ${SRC_URI_ZEPHYR};branch=${ZEPHYR_BRANCH};name=default;destsuffix=git/zephyr \
    ${SRC_URI_ZEPHYR_LIBMETAL};name=libmetal;nobranch=1;destsuffix=git/modules/hal/libmetal \
    ${SRC_URI_ZEPHYR_OPEN_AMP};name=open-amp;nobranch=1;destsuffix=git/modules/lib/open-amp \
"

ZEPHYR_MODULES = "\
${S}/modules/hal/libmetal\;\
${S}/modules/lib/open-amp\;\
"

ZEPHYR_BRANCH = "v3.6-branch"
PV = "3.6.0+git${SRCPV}"

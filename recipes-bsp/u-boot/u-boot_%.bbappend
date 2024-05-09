FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = "file://uEnv-milkv-duo.txt"

do_deploy:append() {
    if [ -f "${WORKDIR}/uEnv-milkv-duo.txt" ]; then
        cp ${WORKDIR}/uEnv-milkv-duo.txt ${DEPLOYDIR}/uEnv.txt
    fi
}

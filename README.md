# meta-milkv
Milk-V Duo overlay for OpenEmbedded/Yocto

[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/kinsamanka/meta-milkv/blob/master/LICENSE)

## Description

This is the general hardware-specific BSP overlay for Milk-V Duo board.

## Dependencies

This layer depends on:

* URI: https://github.com/riscv/meta-riscv
  * branch: master
  * revision: HEAD

## Quick Start

### Install required host packages

Follow the instructions to install Yocto build requirements [here](https://docs.yoctoproject.org/ref-manual/system-requirements.html#required-packages-for-the-build-host).

 * For  Debian/Ubuntu:
    ```shell
    $ sudo apt install gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev python3-subunit mesa-common-dev zstd liblz4-tool file locales libacl1
    $ sudo locale-gen en_US.UTF-8
    ```
Install `kas`
```shell
$ sudo apt install kas
```

### Initial build/setup

```shell
$ cd $HOME
$ mkdir oe
$ cd oe
$ git clone https://github.com/kinsamanka/meta-milkv
$ kas build meta-milkv/kas-project.yml
```

### Update/rebuild

```shell
$ cd oe
$ (cd meta-milkv; git pull)
$ kas build meta-milkv/kas-project.yml
```

## Customize

To add aditional programs, search the needed recipe [here](https://layers.openembedded.org/layerindex/branch/master/recipes/).

For example, to add `python3` to the image, edit `kas-project.yml`:
```diff
diff --git a/kas-project.yml b/kas-project.yml
--- a/kas-project.yml
+++ b/kas-project.yml
@@ -52,4 +52,4 @@ local_conf_header:
     INIT_MANAGER = "mdev-busybox"
     VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
     PREFERRED_PROVIDER_virtual/kernel = "linux-milkv-duo-dev"
-    CORE_IMAGE_EXTRA_INSTALL += " kernel-modules init-ifupdown"
+    CORE_IMAGE_EXTRA_INSTALL += " kernel-modules init-ifupdown python3"
```
If the recipe uses an extra layer, for example `python3-pyserial`:
```diff
diff --git a/kas-project.yml b/kas-project.yml
--- a/kas-project.yml
+++ b/kas-project.yml
@@ -19,6 +19,12 @@ repos:
     refspec: "2.8"
     layers:
       conf: disabled
+  meta-openembedded:
+    url: "https://github.com/openembedded/meta-openembedded"
+    refspec: "scarthgap"
+    layers:
+      meta-oe:
+      meta-python:
   meta-riscv:
     url: "https://github.com/riscv/meta-riscv"
     refspec: c1c671a97025941f7ec4d98e586f357f126e9379
@@ -52,4 +58,4 @@ local_conf_header:
     INIT_MANAGER = "mdev-busybox"
     VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
     PREFERRED_PROVIDER_virtual/kernel = "linux-milkv-duo-dev"
-    CORE_IMAGE_EXTRA_INSTALL += " kernel-modules init-ifupdown"
+    CORE_IMAGE_EXTRA_INSTALL += " kernel-modules init-ifupdown python3 python3-pyserial"
```

## Flash Image

### Using dd
```shell
$ cd oe
$ zcat build/tmp-glibc/deploy/images/milkv-duo/core-image-minimal-milkv-duo.rootfs.wic.gz | \
  sudo dd of=/dev/sdX bs=4M iflag=fullblock oflag=direct conv=fsync status=progress
```

### Using bmaptool
```shell
$ cd oe
$ sudo bmaptool copy build/tmp-glibc/deploy/images/milkv-duo/core-image-minimal-milkv-duo.rootfs.wic.gz /dev/sdX
```

### Create zipped image file
```shell
$ cd oe
$ zcat build/tmp-glibc/deploy/images/milkv-duo/core-image-minimal-milkv-duo.rootfs.wic.gz | \
  dd of=milkv-duo.img bs=4M iflag=fullblock oflag=direct conv=fsync status=progress
$ zip milkv-duo.img.zip milkv-duo.img
```

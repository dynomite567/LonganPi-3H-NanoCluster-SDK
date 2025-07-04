# LonganPi-3H-SDK for NanoCluster

[![mkimg-lpi3h-ci](https://github.com/dynomite567/LonganPi-3H-SDK/actions/workflows/build.yml/badge.svg)](https://github.com/dynomite567/LonganPi-3H-SDK/actions/workflows/build.yml)

**Cloned from [sipeed/LonganPi-3H-SDK](https://github.com/sipeed/LonganPi-3H-SDK)**

[Download Latest Build](https://github.com/dynomite567/LonganPi-3H-SDK/releases/latest)

Scripts and blobs for building a LonganPi 3H image for the NanoCluster.

Builds are triggered manually when needed.

0. Install dependencies

```shell
sudo apt update
sudo apt install qemu-user-static gcc-aarch64-linux-gnu mmdebstrap git binfmt-support make build-essential  bison flex make gcc libncurses-dev debian-archive-keyring swig libssl-dev bc python3-setuptools python3-dev genimage debhelper fuse2fs rsync kmod cpio debian-keyring fuse exfatprogs
```

1. Build arm-trusted-firmware

```shell
./mkatf.sh
```

2. Build uboot

```shell
./mkuboot.sh
```

3. Build kernel

```shell
./mklinux.sh
```

4. Add extra files for LonganPi 3H

```shell
./mkoverlay.sh
```

5. Build Debian rootfs

```shell
./mkrootfs.sh
```

6. Build sdcard image

```shell
./mkimage.sh
```

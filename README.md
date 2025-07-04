# LonganPi-3H-SDK for NanoCluster

[![CircleCI](https://dl.circleci.com/status-badge/img/circleci/QdmNa8ANx1ffexCBKDunDj/U2SfHaPZBLQpBdxUWkxz1Y/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/circleci/QdmNa8ANx1ffexCBKDunDj/U2SfHaPZBLQpBdxUWkxz1Y/tree/main)

**Cloned from [sipeed/LonganPi-3H-SDK](https://github.com/sipeed/LonganPi-3H-SDK)**

[Download Latest Build](https://github.com/dynomite567/LonganPi-3H-SDK/releases/latest)

Scripts and blobs for building a LonganPi 3H image for the NanoCluster.

Builds are triggered manually through CircleCI when needed, and any changes made to the source repository will be mirrored here.

## Changes from the base image
* Enabled `CGROUP_CPUACCT` and `CFS_BANDWIDTH` kernel features for container engines (containerd, podman, k3s)

* Fixed an issue where the first boot script was querying the wrong network interface for the hostname

* Changed default apt repository url to `http://deb.debian.org/`

* Moved the `git` package to be installed as a base package, rather than just having it only install on the CLI-only image

* Removed Tailscale from being pre-installed on the system

* Minor build script bug fixes

**The following are personal changes that may be moved off the main branch in the future**
* Changed DNS server to utilize [Quad9]("https://quad9.net/") by default

* Changed default timezone to `America/Los_Angeles`

## Build from Source

0. Install dependencies

```shell
sudo apt update
sudo apt install qemu-user-static gcc-aarch64-linux-gnu mmdebstrap git binfmt-support make build-essential  bison flex make gcc libncurses-dev debian-archive-keyring swig libssl-dev bc python3-setuptools python3-dev debhelper fuse2fs rsync kmod cpio debian-keyring fuse exfatprogs

# Build and install genimage
git clone https://github.com/pengutronix/genimage.git
cd genimage/
./autogen.sh
./configure
make -j$(nproc)
sudo make install
cd ..
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

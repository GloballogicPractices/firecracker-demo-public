#!/usr/bin/env bash

# download Alpine 3.9.3 mini rootfs
curl -fsSL -o ./images/alpine-minirootfs-3.9.3-x86_64.tar.gz  http://dl-cdn.alpinelinux.org/alpine/v3.9/releases/x86_64/alpine-minirootfs-3.9.3-x86_64.tar.gz

# make new ext4 volume
mkfs.ext4 -t ext4 ./images/alpine-mini-rootfs-3.9.3.ext4 256M

# mount
mkdir custom-rootfs
sudo mount ./images/alpine-mini-rootfs-3.9.3.ext4 ./custom-rootfs

# fill up files to the volume
sudo tar -xpvf ./images/alpine-minirootfs-3.9.3-x86_64.tar.gz -C ./custom-rootfs/

# unmount
sudo umount ./custom-rootfs
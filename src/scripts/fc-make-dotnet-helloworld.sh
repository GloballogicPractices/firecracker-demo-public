#!/usr/bin/env bash

# mount
sudo mount ./images/dotnet-rootfs.ext4 ./custom-rootfs

# extract
sudo tar -zxf src/hello-world/bin/Release/netcoreapp2.2/hello-world.tar.gz -C ./custom-rootfs/root/

# unmount
sudo umount ./custom-rootfs
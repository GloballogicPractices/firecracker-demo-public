#!/usr/bin/env bash

# get & setup binary
curl -LOJ https://github.com/firecracker-microvm/firecracker/releases/download/v0.15.0/firecracker-v0.15.0
mv firecracker-v0.15.0 firecracker
chmod +x ./firecracker
sudo mv ./firecracker /usr/local/bin/
firecracker --version

# ensure access to KVM (after each reboot)
sudo setfacl -m u:${USER}:rw /dev/kvm

# get sample rootfs and kernel
mkdir images
curl -fsSL -o ./images/simple-rootfs.ext4 https://s3.amazonaws.com/spec.ccfc.min/img/hello/fsfiles/hello-rootfs.ext4
curl -fsSL -o ./images/vmlinux.bin https://s3.amazonaws.com/spec.ccfc.min/img/hello/kernel/hello-vmlinux.bin

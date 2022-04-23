#!/bin/bash
apt update && apt upgrade -y
rm -rf /opt/IMSI_Catcher
mkdir /opt/IMSI_Catcher
cd /opt/IMSI_Catcher
read -p "Architecture arm64 or amd64 ?" ARCH
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.3/linux-headers-5.3.0-050300_5.3.0-050300.201909152230_all.deb
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.3/linux-headers-5.3.0-050300-generic_5.3.0-050300.201909152230_$ARCH.deb
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.3/linux-image-unsigned-5.3.0-050300-generic_5.3.0-050300.201909152230_$ARCH.deb
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.3/linux-modules-5.3.0-050300-generic_5.3.0-050300.201909152230_$ARCH.deb
sudo dpkg -i *.deb
read -p "reboot and choose kernel 5.3 ? Ctrl-C to exit/Enter to reboot"
reboot

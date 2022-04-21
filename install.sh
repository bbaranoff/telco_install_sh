#!/bin/bash
sudo su
rm -rf /opt/GSM
mkdir /opt/GSM
cd /opt/GSM
read -p "Architecture arm64 or amd64 ? " ARCH
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.3/linux-headers-5.3.0-050300_5.3.0-050300.201909152230_all.deb
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.3/linux-headers-5.3.0-050300-generic_5.3.0-050300.201909152230_$ARCH.deb
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.3/linux-image-unsigned-5.3.0-050300-generic_5.3.0-050300.201909152230_$ARCH.deb
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.3/linux-modules-5.3.0-050300-generic_5.3.0-050300.201909152230_$ARCH.deb
read -p "reboot and choose kernel 5.3 ? Ctrl-C to exit"
sudo dpkg -i *.deb
reboot
apt update && sudo apt upgrade -y
apt install -y libusb-1.0-0-dev libuhd-dev uhd-host cmake autoconf make
git clone https://github.com/pothosware/SoapySDR
cd /opt/GSM/SoapySDR
mkdir build && cd build && cmake .. && make -j4 && make install && ldconfig
cd /opt/GSM
sudo apt install -y libtool
git clone https://github.com/pothosware/SoapyUHD
cd /opt/GSM/SoapyUHD
mkdir build && cd build && cmake .. && make -j4 && make install && ldconfig
cd /opt/GSM
git clone https://github.com/myriadrf/LimeSuite
cd /opt/GSM/LimeSuite
cd build && cmake .. && make -j4 && make install && ldconfig
cd /opt/GSM
echo "export  UHD_MODULE_PATH=/usr/lib/uhd/modules" >> /root/.bashrc
sudo apt install -y cpufrequtils
sudo apt install -y libsctp-dev libconfig++-dev libconfig-dev libmbedtls-dev
git clone https://github.com/nuand/BladeRF
cd /opt/GSM/BladeRF
mkdir build && cd build && cmake .. && make -j4 && make install && ldconfig
cd /opt/GSM
git clone https://github.com/pothosware/SoapyBladeRF
cd /opt/GSM/SoapyBladeRF
mkdir build && cd build && cmake .. && make -j4 && make install && ldconfig
sudo apt install -y python3-pip pcscd pcsc-tools libpcsclite-dev python3-pyscard
sudo service pcscd start
cd /opt/GSM
git clone https://github.com/osmocom/pySim
cd /opt/GSM/pySim
pip3 install pytlv serial jsonpath-ng construct cmd2 -U
cd /opt/GSM
git clone https://github.com/srsLTE/srsLTE
cd /opt/GSM/srsLTE
mkdir build && cd build && cmake .. && make -j4 && make install && ldconfig
./srslte_install_configs.sh user
wget https://raw.githubusercontent.com/bbaranoff/srslte-rpi4/main/epc.conf
wget https://raw.githubusercontent.com/bbaranoff/srslte-rpi4/main/enb.conf
wget https://raw.githubusercontent.com/bbaranoff/srslte-rpi4/main/user_db.csv
cp enb.conf /root/.config/srslte/enb.conf
cp epc.conf /root/.config/srslte/epc.conf
cp user_db.csv /root/.config/srslte/user_db.csv
cd /opt/GSM
apt install -y libtalloc-dev libgnutls28-dev libmnl-dev
git clone https://github.com/osmocom/libosmocore
cd /opt/GSM/libosmocore
autoreconf -fi && ./configure && make -j4 && make install && ldconfig
cd /opt/GSM
apt install -y libortp-dev
git clone https://github.com/osmocom/libosmo-abis
cd /opt/GSM/libosmo-abis
autoreconf -fi && ./configure --disable-dahdi && make -j4 && make install && ldconfig
cd /opt/GSM
git clone https://github.com/osmocom/libosmo-netif
cd /opt/GSM/libosmo-netif
autoreconf -fi && ./configure && make -j4 && make install && ldconfig
cd /opt/GSM
git clone https://github.com/osmocom/osmo-hlr
apt install -y libsqlite3-dev
cd /opt/GSM/osmo-hlr
autoreconf -fi && ./configure && make -j4 && make install && ldconfig
cd /opt/GSM
git clone https://github.com/osmocom/osmo-mgw
cd /opt/GSM/osmo-mgw
autoreconf -fi && ./configure && make -j4 && make install && ldconfig
cd /opt/GSM
git clone git://git.osmocom.org/libgtpnl.git
cd /opt/GSM/libgtpnl
autoreconf -fi && ./configure && make -j4 && make install && ldconfig
cd /opt/GSM
git clone https://github.com/osmocom/libosmo-sccp
cd /opt/GSM/libosmo-sccp
autoreconf -fi && ./configure && make -j4 && make install && ldconfig
cd /opt/GSM
git clone https://github.com/osmocom/osmo-ggsn
cd /opt/GSM/osmo-ggsn
autoreconf -fi && ./configure --enable-gtp-linux && make -j4 && make install && ldconfig
cd /opt/GSM
apt install -y libc-ares-dev
git clone https://github.com/osmocom/osmo-sgsn
cd /opt/GSM/osmo-sgsn
autoreconf -fi && ./configure && make -j4 && make install && ldconfig
cd /opt/GSM
git clone https://github.com/osmocom/osmo-msc
apt install -y libdbi-dev
cd /opt/GSM/osmo-msc
autoreconf -fi && ./configure && make -j4 && make install && ldconfig
cd /opt/GSM
git clone https://github.com/osmocom/osmo-bsc
cd /opt/GSM/osmo-bsc
autoreconf -fi && ./configure && make -j4 && make install && ldconfig
cd /opt/GSM
apt install -y libsofia-sip-ua-glib-dev
git clone https://github.com/osmocom/osmo-sip-connector
cd /opt/GSM/osmo-sip-connector
autoreconf -fi && ./configure && make -j4 && make install && ldconfig
cd /opt/GSM
git clone https://github.com/osmocom/osmo-trx
cd /opt/GSM/osmo-trx
git checkout 1.1.0
autoreconf -fi && ./configure --with-lms && make -j4 && make install && ldconfig
cd /opt/GSM
git clone https://github.com/osmocom/osmo-bts
cd /opt/GSM/osmo-bts
git checkout 1.1.0
autoreconf -fi && ./configure --enable-trx && make -j4 && make install && ldconfig
cd /opt/GSM
git clone https://github.com/bbaranoff/osmocom-nitb-standalone /etc/osmocom
cp -r /usr/local/bin/. /usr/bin
apt install libdbd-sqlite3
mkdir /var/lib/osmocom
wget https://raw.githubusercontent.com/bbaranoff/PImpMyPi/main/osmo-msc.service
cp osmo-msc.service /lib/systemd/system/osmo-msc.service
systemctl daemon-reload
cd /etc/osmocom
./osmo-all enable
cd /opt/GSM
wget https://nuand.com/downloads/yate-rc-2.tar.gz
tar xfz yate-rc-2.tar.gz
cd yate
wget https://raw.githubusercontent.com/bbaranoff/PImpMyPi/main/endian.patch
patch -p1 < endian.patch
./autogen.sh
./configure
make
make install
ldconfig
cd /opt/GSM/yatebts
./autogen.sh
./configure
make
make install
ldconfig
wget https://raw.githubusercontent.com/bbaranoff/PImpMyPi/main/ybts.conf
cp ybts.conf /usr/local/etc/yate/ybts.conf
cd /lib/modules/$(uname -r)/build/certs
openssl req -new -x509 -newkey rsa:2048 -keyout signing_key.pem -outform DER -out signing_key.x509 -nodes -subj "/CN=Owner/"
apt install -y gcc-9 g++-9 gcc-7 g++-7 gcc-10 g++-10
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70 --slave /usr/bin/g++ g++ /usr/bin/g++-7
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90 --slave /usr/bin/g++ g++ /usr/bin/g++-9
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 100 --slave /usr/bin/g++ g++ /usr/bin/g++-10
cd /opt/GSM/
git clone https://github.com/isdn4linux/mISDN
cd /opt/GSM/mISDN
rm -Rf /lib/modules/$(uname -r)/kernel/drivers/isdn/hardware/mISDN
rm -Rf /lib/modules/$(uname -r)/kernel/drivers/isdn/mISDN/
wget https://raw.githubusercontent.com/bbaranoff/PImpMyPi/main/octvqe.patch
cp /boot/System.map-$(uname -r) /usr/src/linux-headers-$(uname -r)/System.map
ln -s /lib/modules/$(uname -r)/build /lib/modules/$(uname -r)/source
aclocal && automake --add-missing
./configure
patch -p0 < octvqe.patch
make modules
cp /opt/GSM/mISDN/standalone/drivers/isdn/mISDN/modules.order /usr/src/linux-headers-$(uname -r)
cp -rn /usr/lib/modules/$(uname -r)/. /usr/src/linux-headers-$(uname -r)
make modules_install
depmod -a
update-alternatives --set gcc /usr/bin/gcc-7
cd /opt/GSM
apt install bison flex -y
git clone https://github.com/isdn4linux/mISDNuser
cd /opt/GSM/mISDNuser
make
./configure
make
make install
ldconfig
cd example
./configure
make
make install
ldconfig
update-alternatives --set gcc /usr/bin/gcc-10
cd /opt/GSM
wget http://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-11.25.3.tar.gz
tar zxvf asterisk-11.25.3.tar.gz
cd /opt/GSM/asterisk-11.25.3
apt install libncurses-dev libxml2-dev
./configure
make
make install
make config
ldconfig
cd /opt/GSM
git clone http://git.eversberg.eu/lcr.git
cd /opt/GSM/lcr
wget https://raw.githubusercontent.com/bbaranoff/PImpMyPi/main/ast_lcr.patch
wget https://raw.githubusercontent.com/bbaranoff/PImpMyPi/main/sip_gcc.patch
patch -p0 < ast_lcr.patch
patch -p0 < sip_gcc.patch
./autogen.sh
./configure --with-sip --with-gsm-bs --with-gsm-ms --with-asterisk --with-sip
make
make install
ldconfig
apt install php apache2 -y
cp -r /opt/GSM/
bts/nipc/web /var/www/html/nipc
chmod -R a+rw /usr/local/etc/yate/
apt install alsa-oss
apt install --reinstall linux-modules-$(uname -r) -y
cd /etc/asterisk
wget https://raw.githubusercontent.com/bbaranoff/PImpMyPi/main/extensions.conf
wget https://raw.githubusercontent.com/bbaranoff/PImpMyPi/main/sip.conf
#!/bin/bash
sudo su
echo "deb http://fr.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse" >> sources.list
apt update
apt install gcc-4.9 g++-4.9 gcc-7 g++-7 gcc-10 g++-10
sed -i '$ d' /etc/apt/sources.list
apt update
apt install build-essential libgmp-dev libx11-6 libx11-dev flex libncurses5 libncurses5-dev libncursesw5 libpcsclite-dev zlib1g-dev libmpfr4 libmpc3 lemon aptitude libtinfo-dev libtool shtool autoconf git-core pkg-config make libmpfr-dev libmpc-dev libtalloc-dev libfftw3-dev libgnutls28-dev libssl1.0-dev libtool-bin libxml2-dev sofia-sip-bin libsofia-sip-ua-dev sofia-sip-bin libncursesw5-dev libncursesw5-dbg bison libgmp3-dev alsa-oss
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 49 --slave /usr/bin/g++ g++ /usr/bin/g++-4.9
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70 --slave /usr/bin/g++ g++ /usr/bin/g++-7
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 100 --slave /usr/bin/g++ g++ /usr/bin/g++-10
echo "deb http://fr.archive.ubuntu.com/ubuntu/ bionic main restricted universe multiverse" >> sources.list
apt update
apt install gcc-5 g++-5
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 50 --slave /usr/bin/g++ g++ /usr/bin/g++-5
sed -i '$ d' /etc/apt/sources.list
apt update
update-alternative --set gcc /usr/bin/gcc-4.9
apt remove texinfo
mkdir /opt/IMSI_Catcher
cd /opt/IMSI_Catcher
wget http://ftp.gnu.org/gnu/texinfo/texinfo-4.13.tar.gz
gzip -dc < texinfo-4.13.tar.gz | tar -xf -
cd texinfo-4.13
./configure
make
make install
git clone https://github.com/axilirator/gnu-arm-installer.git gnuarm
cd gnuarm
#Run the Scripts
./download.sh
./build.sh
export PATH=$PATH:/root/gnuarm/install/bin
# Now you have cross-compiler ready you can build osmocom with your firmware
cd /opt/IMSI_Catcher
git clone git://git.osmocom.org/libosmocore.git
cd libosmocore
autoreconf -i
./configure
make
make install
ldconfig
cd /opt/IMSI_Catcher
git clone git://git.osmocom.org/libosmo-dsp.git
cd libosmo-dsp
autoreconf -i
./configure
make
make install
cd /opt/IMSI_Catcher
git clone https://github.com/osmocom/osmocom-bb trx
cd trx
git checkout jolly/testing
cd src
sed -i -e  's/#CFLAGS += -DCONFIG_TX_ENABLE/CFLAGS += -DCONFIG_TX_ENABLE/g' target/firmware/Makefile
make HOST_layer23_CONFARGS=--enable-transceiver
cd /opt/IMSI_Catcher

apt install -y libortp-dev
git clone https://github.com/osmocom/libosmo-abis
cd /opt/IMSI_Cacher/libosmo-abis
autoreconf -fi && ./configure --disable-dahdi && make -j4 && make install && ldconfig

cd /opt/IMSI_Catcher
git clone https://github.com/osmocom/libosmo-netif
cd /opt/IMSI_Catcher/libosmo-netif
autoreconf -fi && ./configure && make -j4 && make install && ldconfig

cd /opt/IMSI_Catcher
git clone https://github.com/osmocom/openbsc
cd /opt/IMSI_Catcher/openbsc/openbsc
autoreconf -fi && ./configure --with-lms && make -j4 && make install && ldconfig

cd /opt/IMSI_Catcher
git clone https://github.com/osmocom/osmo-bts
cd /opt/IMSI_Catcher/osmo-bts
git checkout 1.1.0
autoreconf -fi && ./configure --enable-trx && make -j4 && make install && ldconfig

cd /lib/modules/$(uname -r)/build/certs
openssl req -new -x509 -newkey rsa:2048 -keyout signing_key.pem -outform DER -out signing_key.x509 -nodes -subj "/CN=Owner/"
apt install -y gcc-9 g++-9 gcc-7 g++-7 gcc-10 g++-10
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70 --slave /usr/bin/g++ g++ /usr/bin/g++-7
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90 --slave /usr/bin/g++ g++ /usr/bin/g++-9
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 100 --slave /usr/bin/g++ g++ /usr/bin/g++-10
cd /opt/IMSI_Catcher
git clone https://github.com/isdn4linux/mISDN
cd /opt/IMSI_Catcher/mISDN
rm -Rf /lib/modules/$(uname -r)/kernel/drivers/isdn/hardware/mISDN
rm -Rf /lib/modules/$(uname -r)/kernel/drivers/isdn/mISDN/
wget https://raw.githubusercontent.com/bbaranoff/PImpMyPi/main/octvqe.patch
cp /boot/System.map-$(uname -r) /usr/src/linux-headers-$(uname -r)/System.map
ln -s /lib/modules/$(uname -r)/build /lib/modules/$(uname -r)/source
aclocal && automake --add-missing
./configure
patch -p0 < octvqe.patch
make modules
cp /opt/IMSI_Catcher/mISDN/standalone/drivers/isdn/mISDN/modules.order /usr/src/linux-headers-$(uname -r)
cp -rn /usr/lib/modules/$(uname -r)/. /usr/src/linux-headers-$(uname -r)
make modules_install
depmod -a

update-alternatives --set gcc /usr/bin/gcc-7

cd /opt/IMSI_Catcher
apt install bison flex -y
git clone https://github.com/isdn4linux/mISDNuser
cd /opt/IMSI_Catcher/mISDNuser
make
./configure
make
make install
ldconfig
cd example
./configure
make
make install
ldconfig

update-alternatives --set gcc /usr/bin/gcc-10

#Asterisk version (11.25.3) :
wget http://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-11.25.3.tar.gz
tar zxvf asterisk-11.25.3.tar.gz
cd /opt/IMSI_Catcher/asterisk-11.25.3
apt install libncurses-dev libxml2-dev
./configure
make
make install
make config
ldconfig

git clone https://github.com/fairwaves/lcr
cd lcr
autoreconf -i
./configure --with-sip --with-gsm-bs --with-gsm-ms --with-asterisk
make
make install
ldconfig
cp chan_lcr.so /usr/lib/asterisk/modules/
apt-get install alsa-oss
modprobe snd-pcm
modprobe snd-mixer-oss
modprobe mISDN_core
modprobe mISDN_dsp

git clone https://github.com/bbaranoff/lcr_conf /etc/usr/local/lcr
sudo apt update
wget https://github.com/bbaranoff/openLTE2GSM/releases/download/v0.1/uhd_20211230-1_amd64.deb
wget https://github.com/bbaranoff/openLTE2GSM/releases/download/v0.1/soapysdr_20211230-1_amd64.deb
wget https://github.com/bbaranoff/openLTE2GSM/releases/download/v0.1/bladerf_20211230-1_amd64.deb
wget https://github.com/bbaranoff/openLTE2GSM/releases/download/v0.1/soapybladerf_20211230-1_amd64.deb
wget https://github.com/bbaranoff/openLTE2GSM/releases/download/v0.1/soapyuhd_20211230-1_amd64.deb
wget https://github.com/bbaranoff/openLTE2GSM/releases/download/v0.1/gnuradio_20211230-1_amd64.deb
wget https://github.com/bbaranoff/openLTE2GSM/releases/download/v0.1/gr-osmosdr_20211230-1_amd64.deb
wget https://github.com/bbaranoff/openLTE2GSM/releases/download/v0.1/polarssl_20211230-1_amd64.deb
wget https://github.com/bbaranoff/openLTE2GSM/releases/download/v0.1/openlte_20211230-1_amd64.deb
dpkg -i *.deb
export LD_LIBRARY_PATH=/usr/local/lib/
sudo ldconfig
sudo apt install libboost-date-time1.67.0 libboost-filesystem1.67.0 libboost-regex1.67.0 libboost-serialization1.67.0 libboost-serialization1.67.0
echo "Done !!!!"
read -p "press Enter to reboot"

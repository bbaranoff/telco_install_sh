cd /root/nitb
modprobe mISDN_core
modprobe mISDN_dsp
modprobe snd-mixer-oss
modprobe snd-pcm
sudo ./nitb.sh &
cd /opt/IMSI_Catcher/trx/src/host/layer23/src/transceiver
sudo ./transceiver -a 4 -2 -r 99 &
sudo lcr start &&
sudo killall -9 lcr
sudo killall -9 transceiver
sudo killall -9 osmo-nitb
sudo killall -9 osmocon

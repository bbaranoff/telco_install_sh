d /root/nitb
./nitb.sh &
cd /opt/IMSI_Catcher/trx/src/host/layer23/src/transceiver
sudo ./transceiver -a 4 -2 -r 99 &
cd /opt/IMSI_Catcher/osmo-bts/doc/examples/calypso
sudo osmo-bts-trx &
lcr start &
asterisk -cvvvvvvv &&
sudo killall -9 asterisk
sudo killall -9 lcr
sudo killall -9 osmo-bts-trx
sudo killall -9 transceiver
sudo killall -9 osmo-nitb
sudo killall -9 osmocon

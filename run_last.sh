cd nitb
./nitb.sh
cd /opt/IMSI_Catcher/trx/src/layer23/src/transceiver
./transceiver -a 4 -2 -r 99
cd /opt/IMSI_Catcher/osmo-bts/doc/examples/calypso
osmo-bts-trx
asterisk -rvvvvvvv
lcr start

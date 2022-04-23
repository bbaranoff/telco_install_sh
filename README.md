# telco_install_sh

ALL IN ROOT !!!

Installation
============

```
bash install_kernel.sh
```
You will be prompted for amd64 arm64
type one or the other
```
bash imsi_catcher.sh
```


Running
=======
```
cd /opt/IMSI_Catcher/trx/src
./host/osmocon/osmocon -p /dev/ttyUSB0 -s /tmp/osmocom_l2 -m c123xor -c trx.highram.bin -r 99
cd /opt/IMSI_Catcher/trx/src
./host/osmocon/osmocon -p /dev/ttyUSB1 -s /tmp/osmocom_l2.2 -m c123xor -c trx.highram.bin -r 99
```
may need to sqeeze the xor in precedent command
```
cd nitb
./nitb.sh
cd /opt/IMSI_Catcher/trx/src/layer23/src/transceiver
./transceiver -a 4 -2 -r 99
cd /opt/IMSI_Catcher/osmo-bts/doc/examples/calypso
osmo-bts-trx
```

# telco_install_sh
Get ubuntu 20.04.4
https://releases.ubuntu.com/20.04/ubuntu-20.04.4-desktop-amd64.iso

Get VMWare Workstation Player
For Windows : https://www.vmware.com/go/getplayer-win

HW http://shop.sysmocom.de/products/cp2102-25 (x2)

HW C118 C123 motorola for example https://www.ebay.fr/itm/224908022723 (x2)

ALL IN ROOT !!!

Installation
============

```
git clone https://github.com/bbaranoff/telco_install_sh
bash install_kernel.sh
```
You will be prompted for amd64 arm64
type one or the other
```
bash imsi_catcher.sh
nano /etc/asterisk/sip.conf
change id & secret by yours (this works on telnyx.com for example)
```


Running
=======
In 3 shells
```
bash run_first.sh (or if not working run_first_xor.sh)
bash run_sec.sh (or if not working run_first_xor.sh)
bash run_third.sh
bash run_last.sh
```
to route call to real world 
```
nano /etc/asterisk/sip.conf
```
change id and secret by yours for example on https://telnyx.com

to spoof Caller_id
nano /etc/asterisk/extensions.conf
go to the bottom of the file
you will see callerid set your own

service asterisk restart

telnet 0 4242
subscriber id 1 extension "your fake number"

connect to the cell 00101
and call your victim

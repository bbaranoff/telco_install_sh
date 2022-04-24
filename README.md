# telco_install_sh

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
bash run_first.sh
bash run_sec.sh
bash run_third.sh
bash run_last.sh
```

to spoof Caller_id
nano /etc/asterisk/extensions.conf
go to the bottom of the file
you will see callerid set your own

rerun

telnet 0 4242
subscriber id 1 extension "your fake number"

connect to the cell 00101
and call your victim

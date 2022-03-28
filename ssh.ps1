#usage: .\ssh.bat p4401
#
curl http://35.209.211.153/%1 -o %1
dir
ssh -i .\%1 %1@35.209.211.153

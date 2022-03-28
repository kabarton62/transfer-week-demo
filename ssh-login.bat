REM usage: .\ssh-login.bat <username> <ip-address>
REM
curl http://%2/%1 -o %1
dir
ssh -i .\%1 %1@%2
del %1
EXIT /B

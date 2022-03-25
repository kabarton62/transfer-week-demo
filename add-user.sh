#! /bin/bash
# Add users with usernames p4401 to p4430 and creates their home directories.
pword=$1
uadd="/usr/bin/sudo /usr/sbin/useradd"
mdir="/usr/bin/sudo /usr/bin/mkdir"
cown="/usr/bin/sudo /usr/bin/chown"
for i in {4401..4430}
do
  user="p$i"
  $uadd -p $(openssl passwd -1 $pword) $user
  $mdir /home/$user
  $cown $user:$user /home/$user
done

#! /bin/bash
# Add users with usernames p4401 to p4430 and creates their home directories.
pword=$1
uadd="/usr/bin/sudo /usr/sbin/useradd"
mdir="/usr/bin/sudo /usr/bin/mkdir"
cown="/usr/bin/sudo /usr/bin/chown"
ruser="/usr/bin/sudo /usr/sbin/runuser"
for i in {4401..4430}
do
  user="p$i"
  $uadd -p $(openssl passwd -1 $pword) $user
  $mdir /home/$user
  $cown $user:$user /home/$user
  $ruser -l $user -c "/usr/bin/mkdir .ssh; chmod 700 .ssh; cd .ssh; ssh-keygen -f $user -t rsa -N '';
  chmod 600 /home/$user/.ssh/*;" 
  $ruser -l $user -c "/usr/bin/cp /home/$user/.ssh/$user.pub /home/$user/.ssh/authorized_keys"
  /usr/bin/sudo /usr/bin/cp /home/$user/.ssh/$user /var/www/html/$user
done
/usr/bin/sudo /usr/bin/chmod 644 /var/www/html/*
ls -l /var/www/html/

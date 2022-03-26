for i in {4401..4430}
do 
  u="p$i"
  echo $u
  sudo deluser $u
  sudo rm -r /home/$u
  sudo rm /var/www/html/$u
done
ls /home/
ls /var/www/html/ 

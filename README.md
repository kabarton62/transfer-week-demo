# transfer-week-demo
Provides scripts to:
  1. **docker-install.sh**: Install Docker engine on Ubuntu
  2. **add-user.sh**:       Add users on an Ubuntu server and distribute private keys (in the worst way possible)
  3. **mutillidae.sh**:     Deploy a Mutillidae Docker container
  4. **ssh.ps1**:           Start a SSH shell using a Windows PowerShell script (so there's not a lot of time spent troubleshooting failed SSH attempts). The script downloads an SSH-RSA private key and uses that key to ssh into shell-box.
  5. **deluser.sh**:        Delete all those users we added and their ssh-rsa keys
  6. **revshell-gen.sh**:   Used to generate reverse shells for each student, assuming the usernames are p4401 through p4430. Obviously won't work if the username  doesn't fit this format.
 
Lab Set-up
  1. Deploy two instances in GCP, such as TARGET and SHELL-BOX
  2. Prepare the firewall to allow TCP 80 & 8080 from whatever sources you trust to SHELL-BOX and TARGET. DO NOT EXPOSE HOSTS TO UNTRUSTED SOURCES!
  3. On SHELL-BOX, install python3, apache2, nmap, net-tools and netcat.
  4. On SHELL-BOX, run **add-user.sh** to add 30 users. Usernames reflect the TCP port each user can use. Done just to prevent students from attempting to use the same port. _If something goes wrong, delete users with **deluser.sh**_.
  5. After user's login to SHELL-BOX, they can each run **revshell-gen.sh** to generate a reverse shell. This could be done manually, but hopefully the script avoids errors in creating the reverse shells.
  6. On TARGET, install net-tools, apache2, & I guess that's it.
  7. On TARGET, run **docker-install.sh** to install Docker Engine.
  8. On TARGET, run **mutillidae.sh** to start the Mutillidae container and expose it to TCP 8080 on TARGET.
  9. Put a copy on ssh.ps1 on each Windows workstation that students would use to participate in the demo. Students run ssh.ps1 to a) download the ssh-rsa private key and 2) connect to the SHELL-BOX. Run the PowerShell script as **.\ssh.ps1 <username> <SHELL-BOX IP>**. Each student should be assigned a unique user, such as p4401.

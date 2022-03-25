#! /bin/bash
# Remove old docker-engine versions
sudo apt-get remove docker docker-engine docker.io containerd runc

# Update the repository 
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release 

# Add docker’s official GPG key 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add a stable repository for the docker engine 
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
# Install the docker engine 
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

sudo apt install -y docker-compose

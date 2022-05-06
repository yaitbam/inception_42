#Lubuntu 18.04 VM

sudo apt install net-tools -y
sudo apt install openssh-server -y
sudo service ssh start
sudo ufw disable

echo "Install Vim"
sudo apt install vim -y
sudo apt install curl -y
sudo apt install make -y 

echo "Install docker"

sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

echo "Executing the Docker Command Without Sudo"

sudo usermod -aG docker ${USER}
su - ${USER}

echo "Install docker compose"

sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)"  -o /usr/local/bin/docker-compose
sudo mv /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
sudo apt-get install docker-compose -y

echo "Install filezilla"
sudo apt-get install filezilla -y
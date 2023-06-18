#!/bin/bash

# install docker
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" -y
sudo apt-cache policy docker-ce
sudo apt install docker-ce -y

# clone repo and build the image from previous lab
git clone https://github.com/SonyaSytnik/CloudComputingLab1.git
cd CloudComputingLab1
sudo docker build -t webserver .

# run nginx container with sample web page
sudo docker run -it -d -p 8080:80 --name web webserver
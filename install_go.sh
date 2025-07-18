#!/bin/bash

wget https://go.dev/dl/go1.24.5.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.24.5.linux-amd64.tar.gz
echo export PATH=$PATH:/usr/local/go/bin >> $HOME/.bashrc
echo export PATH=$PATH:/usr/local/go/bin | sudo tee -a /etc/profile
source $HOME/.bashrc
source /etc/profile
go version
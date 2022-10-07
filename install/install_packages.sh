#!/bin/bash

sudo apt update
sudo apt install \
	meld \
	openssh-server \
	repo \
	python3-pip \
	tmux \
	tree \
	vim \

# vs code
# https://linuxhint.com/install-visual-studio-code-ubuntu22-04/

# docker
# https://linuxhint.com/install-docker-ubuntu-22-04/
# https://cloudcone.com/docs/article/how-to-install-docker-on-ubuntu-22-04-20-04/

pip3 install docker-compose

# tmux plugins
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

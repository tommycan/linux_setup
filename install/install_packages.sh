#!/bin/bash

sudo apt update
sudo apt install \
	bat \
	kdiff3 \
	libnotify \
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

# https://github.com/sharkdp/bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat


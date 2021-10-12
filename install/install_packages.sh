#!/bin/bash

sudo apt update
sudo apt install \
	tmux \
	vim \
	tree \
	meld

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


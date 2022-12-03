#!/bin/bash

# https://github.com/so-fancy/diff-so-fancy
git clone https://github.com/so-fancy/diff-so-fancy.git ${HOME}/.diff-so-fancy

mkdir -p ${HOME}/.local/bin
ln -s ${HOME}/.diff-so-fancy/diff-so-fancy ${HOME}/.local/bin/.


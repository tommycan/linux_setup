#!/bin/bash

# Pre-requisites
# https://github.com/pyenv/pyenv/wiki#suggested-build-environment
sudo apt-get update;
sudo apt-get install make build-essential libssl-dev zlib1g-dev \
	libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
	libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# Install pyenv
# https://github.com/pyenv/pyenv-installer
curl https://pyenv.run | bash

## Add to your .bashr
## https://github.com/pyenv/pyenv  
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init --path)"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

## Important to specify --enable-shared, as described
## https://blog.michelemattioni.me/2016/03/06/pyenv-install-using-shared-library/
#env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install -v 3.6.9


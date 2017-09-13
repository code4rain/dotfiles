#! /usr/bin/env bash

if [ "$(id -u)" != "0" ]; then
    echo "Sorry, you are not root."
    exit 1
fi

apt-get install python-dev python-pip python3-dev python3-pip
add-apt-repository ppa:neovim-ppa/unstable
apt-get update
apt-get install neovim
pip3 install neovim
update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
update-alternatives --config vi
update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
update-alternatives --config vim
update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
update-alternatives --config editor

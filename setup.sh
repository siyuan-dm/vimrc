#!/bin/bash/

set -e

# Install nodejs
sudo curl -sL install-node.now.sh/lts | sudo bash

# Config vim
bash install_awesome_vimrc.sh
vim +PlugInstall +qall
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d difftool

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb && rm ripgrep_13.0.0_amd64.deb

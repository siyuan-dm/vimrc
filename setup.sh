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

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"


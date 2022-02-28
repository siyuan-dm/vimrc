#!/usr/bin/env bash

set -e

curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
rm -rf ~/.vim_runtime && git clone https://github.com/siyuan-dm/vimrc.git ~/.vim_runtime
bash ~/.vim_runtime/install_awesome_vimrc.sh

# Install plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

# wget -O ~/cmake.tar.gz https://github.com/Kitware/CMake/releases/download/v3.23.0-rc2/cmake-3.23.0-rc2-linux-x86_64.tar.gz
# (cd ~ && tar xf ~/cmake.tar.gz)
# echo "export PATH=~/cmake-3.23.0-rc2-linux-x86_64/bin:$PATH" >> ~/.bashrc

# sudo add-apt-repository ppa:jonathonf/vim && sudo apt update && sudo apt install -y vim g++-8
# sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 700 --slave /usr/bin/g++ g++ /usr/bin/g++-7
# sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8

# source ~/.bashrc

(cd ~/.vim/plugged/YouCompleteMe && ./install.py --clangd-completer)

mkdir -p ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

RIPGREP_VERSION=$(curl -s "https://api.github.com/repos/BurntSushi/ripgrep/releases/latest" | grep -Po '"tag_name": "\K[0-9.]+')
curl -Lo ripgrep.deb "https://github.com/BurntSushi/ripgrep/releases/latest/download/ripgrep_${RIPGREP_VERSION}_amd64.deb"
sudo apt install -y ./ripgrep.deb

INSTALL_DIR="/usr/local/bin"
VERSION="0.5.2"
(
  cd "${INSTALL_DIR}" \
  && sudo curl -L "https://github.com/grailbio/bazel-compilation-database/archive/${VERSION}.tar.gz" | sudo tar -xz \
  && sudo ln -f -s "${INSTALL_DIR}/bazel-compilation-database-${VERSION}/generate.py" bazel-compdb
)

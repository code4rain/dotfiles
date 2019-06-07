#! /usr/bin/env bash

set -e

source $HOME/bin/color.sh

CORE=`cat /proc/cpuinfo | grep processor | tail -n 1 | cut -d' ' -f 2`

BUILD_ROOT_DIR="$HOME/External"
DOT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

POWERLEVEL10K_DIR="$BUILD_ROOT_DIR/powerlevel10k"
POWERLEVEL10K_GITHUB="https://github.com/romkatv/powerlevel10k.git"

ZSH_AUTOSUGGESTION_DIR="$BUILD_ROOT_DIR/zsh-autosuggestions"
ZSH_AUTOSUGGESTION_GITHUB="https://github.com/zsh-users/zsh-autosuggestions.git"

TIG_DIR="$BUILD_ROOT_DIR/tig"
TIG_GITHUB="https://github.com/jonas/tig.git"
TIG_BUILD="sudo apt-get install -y automake libncurses5-dev libncursesw5-dev && sh autogen.sh && echo 'configure' && ./configure && echo 'make' && make -j $CORE && echo 'systemwide install' && sudo make install"

RANGER_DIR="$BUILD_ROOT_DIR/ranger"
RANGER_GITHUB="https://github.com/hut/ranger.git"
RANGER_BUILD="sudo apt-get install -y automake libncurses5-dev libncursesw5-dev && sudo -H pip install pylint && sudo make install"

TMUX_DIR="$BUILD_ROOT_DIR/tmux"
TMUX_GITHUB="https://github.com/ThomasAdam/tmux.git"
TMUX_BUILD="sudo apt-get install -y libevent-dev libncurses5-dev libncursesw5-dev byacc && sh autogen.sh && echo 'configure' && ./configure && echo 'make' && make -j $CORE && echo 'systemwide install' && sudo make install"

CTAG_DIR="$BUILD_ROOT_DIR/ctag"
CTAG_GITHUB="https://github.com/universal-ctags/ctags.git"
CTAG_BUILD="sudo apt-get install -y curl wget ncurses-dev python git && ./autogen.sh && ./configure && make -j $CORE && sudo make install"

GLOBAL_TAR_URL="ftp.gnu.org/pub/gnu/global/global-6.6.3.tar.gz"
GLOBAL_BUILD="sudo apt-get install -y bison && sh reconf.sh && .configure && make -j $CORE && sudo make install && cp gtags.conf ~/.globalrc"

INSTALL_PACKAGES="build-essential automake cmake libncurses5-dev libncursesw5-dev colordiff python-pip python3-pip"

install_tmuxinator() {
  sudo apt-get install -y rubygems || sudo apt-get install -y rubygems-integration;
  sudo -H gem install tmuxinator
}

install_deb_from_github() {
  local URL=$(curl -s https://api.github.com/repos/$1/releases/latest | grep "browser_download_url.*_amd64.deb" | cut -d : -f 2,3 | tr -d \")
  local PACKAGE=$(basename ${URL})
  if [ -f "/tmp/$PACKAGE" ] 
  then
    msg_cyan
    echo "Already installed $PACKAGE"
    msg_nc
    return
  fi

  msg_cyan
  echo ">> wget -q --show-progress ${URL} /tmp/$PACKAGE <<"
  wget -q --show-progress ${URL} -O /tmp/$PACKAGE
  msg_green
  echo ">> Let's Install! <<"
  msg_blue
  echo ">> sudo dpkg -i /tmp/$PACKAGE <<"
  sudo dpkg -i /tmp/$PACKAGE
  msg_nc
}

install_pip() {
  sudo -H pip3 install --upgrade $1
  sudo -H pip2 install --upgrade $1
}

install_targz() {
  local URL=$1
  local BUILDCMD=$2
  local PACKAGE=$(basename ${URL})
  if [ -f "/tmp/$PACKAGE" ]
  then
    msg_cyan
    echo "Already installed $PACKAGE"
    msg_nc
    return
  fi
  wget -q --show-progress ${URL} -O /tmp/$PACKAGE
  tar zxf /tmp/$PACKAGE
  msg_green
  echo ">> Let's build! <<"
  msg_cyan
  echo ">>> Move ${PACKAGE/.tar.gz/} <<<"
  cd ${PACKAGE/.tar.gz/}
  msg_blue
  echo ">> $BUILDCMD <<"
  eval $BUILDCMD
  result=$?
  if [ "0" != "$result" ]
  then
    msg_red
    echo ">> Failed!! ${PACKAGE}: Result=$result <<"
    msg_nc
    exit 1
  else
    msg_green
    echo ">> Sucess!! $PACKAGE <<"
    msg_nc
  fi
}

clone_or_update_and_build() {
  if [ -d "$2" ]
  then
    echo "$2 is exist"
    msg_cyan
    echo ">> Run git pull for $2 <<"
    msg_nc
    cd $2
    git stash
    git pull --rebase
  else
    git clone $1 $2
  fi

  if [ ! -z "${3}" ]
  then
    msg_green
    echo ">> Let's build! <<"
    msg_cyan
    echo ">>> Move ${2} <<<"
    cd ${2}
    msg_blue
    echo ">> ${3} <<"
    msg_nc
    eval ${3}
    result=$?
    if [ "0" != "$result" ]
    then
      msg_red
      echo ">> Failed!! ${2}: Result=$result <<"
      msg_nc
      exit 1
    else
      msg_green
      echo ">> Sucess!! $2 <<"
      msg_nc
    fi
  fi
}

install_programs() {
  install_tmuxinator
  install_deb_from_github "BurntSushi/ripgrep"
  install_deb_from_github "sharkdp/bat"
  install_pip "prompt_toolkit"
  install_pip "pygments"
  clone_or_update_and_build $CTAG_GITHUB $CTAG_DIR "$CTAG_BUILD"
  install_targz "$GLOBAL_TAR_URL" "$GLOBAL_BUILD"
}

msg_green
echo "Install Essential packages - ${INSTALL_PACKAGES}"
# Check essential
sudo apt-get install -y ${INSTALL_PACKAGES}
msg_nc
install_programs
msg_blue
echo "Install neovim"
msg_nc
sudo $DOT_DIR/bin/scripts/nvim_install.sh
msg_green
echo "Install neovim done"
msg_nc

pushd .
clone_or_update_and_build $POWERLEVEL10K_GITHUB $POWERLEVEL10K_DIR
clone_or_update_and_build $ZSH_AUTOSUGGESTION_GITHUB $ZSH_AUTOSUGGESTION_DIR
clone_or_update_and_build $TIG_GITHUB $TIG_DIR "${TIG_BUILD}"
clone_or_update_and_build $RANGER_GITHUB $RANGER_DIR "${RANGER_BUILD}"
clone_or_update_and_build $TMUX_GITHUB $TMUX_DIR "${TMUX_BUILD}"
popd
msg_green
echo ">> All Success!! <<"
msg_nc

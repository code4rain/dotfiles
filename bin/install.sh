#! /usr/bin/env bash

DOT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
OH_MY_ZSH_DIR="$HOME/.oh-my-zsh"
OH_MY_ZSH_GITHUB="https://github.com/robbyrussell/oh-my-zsh.git"
OH_MY_ZSH_AUTOSUGGESTION_DIR="$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
OH_MY_ZSH_AUTOSUGGESTION_GITHUB="https://github.com/zsh-users/zsh-autosuggestions.git"

TIG_DIR="$HOME/@WORK/tig"
TIG_GITHUB="https://github.com/jonas/tig.git"
TIG_BUILD="sudo apt-get install -y automake libncurses5-dev && sh autogen.sh && echo 'configure' && ./configure && echo 'make' && make -j32 && echo 'systemwide install' && sudo make install"

RANGER_DIR="$HOME/@WORK/ranger"
RANGER_GITHUB="https://github.com/hut/ranger.git"
RANGER_BUILD="sudo apt-get install -y automake libncurses5-dev && sudo make install"

TMUX_DIR="$HOME/@WORK/tmux"
TMUX_GITHUB="https://github.com/ThomasAdam/tmux.git"
TMUX_BUILD="sudo apt-get install -y libevent-dev && sh autogen.sh && echo 'configure' && ./configure && echo 'make' && make -j32 && echo 'systemwide install' && sudo make install"

INSTALL_PACKAGES="build-essential automake libncurses5-dev"

clone_or_update() {
  if [ -d "$2" ]
  then
    echo "$2 is exist"
    msg_cyan
    echo ">> Run git pull for $2 <<"
    msg_nc
    cd $2
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
      echo "Failed!! Result=$result"
      msg_nc
      exit 1
    else
      msg_green
      echo "Sucess!! $2 "
      msg_nc
    fi
  fi
}

source $HOME/bin/color.sh
msg_green
echo "Install Essential packages - $INSTALL_PACKAGES"
# Check essential
sudo apt-get install $INSTALL_PACKAGES
msg_nc
msg_blue
echo "Install neovim"
msg_nc
$DOT_DIR/bin/scripts/nvim_install.sh
msg_green
echo "Install neovim done"
msg_nc

pushd .
./instGlobal.sh
clone_or_update $OH_MY_ZSH_GITHUB $OH_MY_ZSH_DIR
clone_or_update $OH_MY_ZSH_AUTOSUGGESTION_GITHUB $OH_MY_ZSH_AUTOSUGGESTION_DIR
clone_or_update $TIG_GITHUB $TIG_DIR "${TIG_BUILD}"
clone_or_update $RANGER_GITHUB $RANGER_DIR "${RANGER_BUILD}"
clone_or_update $TMUX_GITHUB $TMUX_DIR "${TMUX_BUILD}"
popd
msg_green
echo "All Success!!"
msg_nc

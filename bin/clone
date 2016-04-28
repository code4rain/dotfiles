#! /usr/bin/env bash
OH_MY_ZSH_DIR="$HOME/.oh-my-zsh"
OH_MY_ZSH_GITHUB="https://github.com/robbyrussell/oh-my-zsh.git"

TIG_DIR="$HOME/bin/tig"
TIG_GITHUB="https://github.com/jonas/tig.git"
TIG_BUILD="sh autogen.sh && echo 'configure' && ./configure && echo 'make' && make -j32 && echo 'systemwide install' && sudo make install"

RANGER_DIR="$HOME/bin/ranger"
RANGER_GITHUB="https://github.com/hut/ranger.git"
RANGER_BUILD="sudo make install"

AG_DIR="$HOME/bin/ag"
AG_GITHUB="https://github.com/ggreer/the_silver_searcher.git"
AG_BUILD="sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev && ./build.sh && sudo make install"

TMUX_DIR="$HOME/bin/tmux"
TMUX_GITHUB="https://github.com/ThomasAdam/tmux.git"
TMUX_BUILD="sh autogen.sh && echo 'configure' && ./configure && echo 'make' && make -j32 && echo 'systemwide install' && sudo make install"

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
cp -R ../module/bin/* $HOME/bin
source $HOME/bin/color.sh
pushd .
clone_or_update $OH_MY_ZSH_GITHUB $OH_MY_ZSH_DIR
clone_or_update $TIG_GITHUB $TIG_DIR "${TIG_BUILD}"
clone_or_update $RANGER_GITHUB $RANGER_DIR "${RANGER_BUILD}"
clone_or_update $AG_GITHUB $AG_DIR "${AG_BUILD}"
clone_or_update $TMUX_GITHUB $TMUX_DIR "${TMUX_BUILD}"
popd
msg_green
echo "All Success!!"
msg_nc

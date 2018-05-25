# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#shopt -s nocaseglob
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
color_prompt=yes

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
# force_color_prompt=yes

if [ -f ~/.git-prompt.sh ]; then
	. ~/.git-prompt.sh
fi
# if [ -f /usr/local/lib/python2.6/dist-packages/Powerline-beta-py2.6.egg/powerline/bindings/bash/powerline.sh ]; then
# 	. /usr/local/lib/python2.6/dist-packages/Powerline-beta-py2.6.egg/powerline/bindings/bash/powerline.sh
# fi
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi
show_sympath () {
	if [[ -h $(pwd) ]]; then
		echo ""
		echo -n "SYMLINK: $(readlink -f .)"
	fi
}

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[0;32m\]\u\e[0;33m@\e[0;36m\h\e[0;33m \w\033[0m\033[0m\e[0;36m$(show_sympath)\033[0m\e[0;35m$(__git_ps1 "\n (%s) ")\033[0m\n:: '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h   \w:: '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -al'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# TO DO TEXT CLI
#export TODOTXT_DEFAULT_ACTION=ls
#export TODOTXT_SORT_COMMAND='env LC_COLLATE=C sort -k 2,2 -k 1,1n'
#export TODOTXT_DATE_ON_ADD=1
#alias t='todo.sh -d ~/bin/todo/todo.cfg'
#if [ -f ~/bin/todo/todo_completion ]; then
#    . ~/bin/todo/todo_completion
#    complete -F _todo t
#fi
#export PATH=${PATH}:${HOME}/bin/todo # TO DO TEXT CLI

# Korean Language Setting
#LANG="ko_KR.UTF-8"
#LANG="en_US.UTF-8"

# export JAVA_HOME=/usr/lib/jvm/jdk1.7.0_51
# export CLASSPATH=.:$JAVA_HOME/lib
# export ANDROID_JAVA_HOME=$JAVA_HOME
# export PATH=$ANDROID_JAVA_HOME/bin:/usr/local/bin:$PATH
# export PATH=${HOME}/bin:${PATH}:${HOME}/p4utils:${HOME}/p4utils/lib

# export PATH=${PATH}:~/usr/lib
# export PATH=${PATH}:~/android-sdks/platform-tools
# export ARCH=arm
# export CROSS_COMPILE=$SEC_KERNEL_COMPILER/arm-none-linux-gnueabi-
# export CROSS_COMPILE="/usr/local/arm/arm-eabi-4.6/bin/arm-eabi-"
# export TOOLCHAIN=/usr/local/arm/arm-eabi-4.6/
# export LD_LIBRARY_PATH=$TOOLCHAIN/mpfr/lib:$TOOLCHAIN/gmp/lib:/usr/local/libiconv/lib:$LD_LIBRARY_PATH
# export SEC_KERNEL_COMPILER=/opt/toolchains/arm-2009q3/bin

# Sets the Mail Environment Variable

# MAIL=/var/spool/mail/alex.jang && export MAIL

# For kernel standalone build
# export ARCH=arm
# export SUBARCH=exynos

# Using cd history
source ~/bin/cd_func.sh

export USE_CCACHE=1

GIT_PROXY_COMMAND=/home/alex/bin/gitproxy

export P4EDITOR=vim
export P4MERGE=p4merge
export EDITOR=vim
ranger_cd () {
	command ranger --choosedir=${HOME}/.lastdir &&
	cd $(cat ${HOME}/.lastdir)
}
# source ~/.fzf.bash

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# Enable programmable sdb completion features.
if [ -f ~/.sdb/.sdb-completion.bash ]; then
 source ~/.sdb/.sdb-completion.bash
fi
export PATH=/home/alex.jang/@Work/ahbuild:$PATH
export BOOT_COMPILE_64=/opt/toolchains/arm-eabi-4.9/bin/aarch64-linux-android-
export BOOT_COMPILE_32=/opt/toolchains/arm-eabi-4.6/bin/arm-eabi-

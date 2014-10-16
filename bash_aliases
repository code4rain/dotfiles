alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias vim='vim -p'
alias pv='p4v&'
alias r=ranger_cd
alias 1='ssh -X $(whoami)@10.252.250.240'
alias 2='ssh -X $(whoami)@10.252.251.110'
alias 3='ssh -X $(whoami)@10.252.250.239'
alias 4='ssh -X $(whoami)@10.252.251.137'
alias 5='ssh -X root@10.253.94.187'
alias bc='bcompare &'
alias t='task'
export VZW=$(whoami)@10.252.250.240
export REG=$(whoami)@10.252.251.110
export NAC=$(whoami)@10.252.250.239
export SYS=$(whoami)@10.252.250.239
export DT=root@10.253.94.187
alias ag='ag --color-line="2;32" --color-match="2;33" --color-path="4;36"'
alias aa='ag -a --color-line="2;32" --color-match="2;33" --color-path="4;36"'
alias gg='git grep'
alias pdiff='p4 diff -du | colordiff | less -R'
alias mkdir='mkdir -p'
alias emacs='emacs -nw'
alias tmux='tmux -2'
alias tn='tmux attach -t normal'
alias tm='tmux attach -t merge'
alias k='source ~/bin/arm-compile.sh'


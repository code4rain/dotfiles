# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="kolo"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
# Syntax
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
plugins=(zsh-autosuggestions zsh-syntax-highlighting)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor line)

source $ZSH/oh-my-zsh.sh

# User configuration
bindkey '^ ' autosuggest-accept

export PATH="${HOME}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
DIRSTACKSIZE=50
cdpath=(. ~)

fpath=( ${HOME}/.zsh/func ${HOME}/.zsh/completion $fpath )

export EDITOR=vi
# export EDITOR='emacsclient -t'
export VISUAL=vi

# Load profile
if [[ -r ${HOME}/.profile ]]; then
	source ${HOME}/.profile
fi

# Load git_ps1
if [[ -r ${HOME}/.git-prompt.sh ]]; then
	. ${HOME}/.git-prompt.sh
fi
setopt PROMPT_SUBST;

psvar=()
# Set the title to "user@host: directory"
case $TERM in
    (rxvt*|xterm*)
        precmd () {
            print -Pn "\e]0;%n@%m: %~\a"
            psvar[2]=$(__git_ps1)
        }
	;;
esac

autoload -U colors && colors
CURRENT_BG='NONE'
SEGMENT_SEPARATOR='⮀'

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n "%{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%}"
  else
    echo -n "%{$bg%}%{$fg%}"
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
	if [[ -n $CURRENT_BG ]]; then
		echo -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
	else
		echo -n "%{%k%}"
	fi
	echo "%{%f%}\n"
	echo "::"
	CURRENT_BG=''
}
prompt_context() {
	prompt_segment black yellow ""
}
prompt_rcontext() {
	prompt_segment black default "%n@%m"
}
prompt_head_dir() {
	CURRENT_PWD=`dirname $(pwd)`
	if [[ $CURRENT_PWD = / ]]; then
		prompt_segment cyan black " "
	elif [[ $(pwd) = ${HOME} ]]; then
		prompt_segment cyan black "~"
	else
		CURRENT="$(pwd)"
		CURRENT="${CURRENT_PWD%/*}"
		CURRENT="${CURRENT_PWD/$HOME/~}"
		prompt_segment yellow black " ${CURRENT_PWD}"
	fi
}
prompt_dir() {
	prompt_segment yellow  black " %1~ "
}
prompt_git() {
	prompt_segment black red "$(__git_ps1 '(%s)')"
}
prompt_git_temp() {
  local ref dirty mode repo_path
  repo_path=$(git rev-parse --git-dir 2>/dev/null)

  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    dirty=$(git diff --shortstat 2> /dev/null | tail -n1)
    if [[ -n $dirty ]]; then
      prompt_segment black red "%2v"
    else
      prompt_segment black yellow "%2v"
    fi
  fi
}
build_prompt() {
	prompt_context
	prompt_head_dir
	prompt_dir
	prompt_git
	prompt_end
}
simple_prompt_dir() {
	CURRENT_PWD=`dirname $(pwd)`
	if [[ $(pwd) = / ]]; then
		echo -n "/"
	elif [[ $CURRENT = / ]]; then
		echo -n "$(pwd)"
	elif [[ $(pwd) = ${HOME} ]]; then
		echo -n "%F{cyan}~%{%f%}"
	else
		CURRENT_PWD="$(pwd)"
		CURRENT_PWD="${CURRENT_PWD%/*}"
		CURRENT_PWD="${CURRENT_PWD/$HOME/~}"
		echo -n "%F{cyan}${CURRENT_PWD}/%{%f%}"
		echo -n "%F{yellow}$(basename $(pwd))%{%f%}"
	fi
}
simple_prompt() {
	echo -n "%F{green}%n%{%f%}%{%F{yellow}%}@%{%f%}%{%F{cyan}%}%m%{%f%}    "
	simple_prompt_dir
	if [[ -h $(pwd) ]]; then
		echo -n "\nSYMLINK: %F{cyan}$(readlink $(pwd))%{%f%}"
	fi
	echo "%{%F{magenta}%}$(__git_ps1 '\n(%s)')%{%f%}"
	echo -n "::"
}
# Set the prompt
#PROMPT='%{%f%b%k%}$(build_prompt) '
PROMPT='%{%f%b%k%}$(simple_prompt) '
#RPROMPT='%F{000}%n@%m%f'
# PS1=$'%{\e[36m%}%v %{\e[0m%}'
if [[ $UID == 0 ]]; then
    psvar='##'
fi
# Set up completion
autoload -U compinit
compinit -i

# From zsh book
zstyle ':completion:*:warnings' format 'No matches: %d'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Show and group completions by description
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# From zsh-lovers
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ${HOME}/.zsh/cache
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:functions' ignored-patters '_*'

autoload bashcompinit
bashcompinit

source ~/.gp4_completion
source ~/.build_completion

setopt                  \
    aliases             \
    NO_all_export       \
    always_last_prompt  \
    NO_always_to_end    \
    append_history      \
    auto_cd             \
    auto_list           \
    auto_menu           \
    auto_name_dirs      \
    auto_param_slash    \
    auto_remove_slash   \
    auto_pushd          \
    NO_beep             \
    chase_dots          \
    chase_links         \
    NO_clobber          \
    correct             \
    extended_glob       \
    hash_cmds           \
    hash_dirs           \
    hash_list_all       \
    hist_find_no_dups   \
    hist_ignore_dups    \
    hist_ignore_all_dups\
    hist_verify         \
    inc_append_history  \
    list_ambiguous      \
    multios             \
    NO_overstrike       \
    pushd_ignore_dups   \
    pushd_minus         \
# Keybindings
bindkey -e

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Global aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g M='| most'
alias -g V='| view -'
alias -g A='| ag'
alias shopt=':'
alias _expand=_bash_expand
alias _complete=_bash_comp

if [ -f $HOME/.aliases ]; then
    source $HOME/.aliases
fi
# Auto Load
autoload zmv
source ~/.fzf.zsh
# Work for git ^
setopt NO_NOMATCH
unsetopt CHASE_DOTS
unsetopt CHASE_LINKS

# For mux
source ~/.tmuxinator/tmuxinator.zsh
export P4MERGE=p4merge
export LESSGLOBALTAGS=global

# export TERM='xterm-256color'

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NVM_DIR="/home/alex.jang/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi

export ALTERNATE_EDITOR=""

export PATH=~/bin/.anaconda3/bin:$PATH
export PATH=~/bin/.anaconda2/bin:$PATH
export PATH=/home/alex.jang/@Work/ahbuild:$PATH
export BOOT_COMPILE_64=/opt/toolchains/arm-eabi-4.9/bin/aarch64-linux-android-
export BOOT_COMPILE_32=/opt/toolchains/arm-eabi-4.6/bin/arm-eabi-

[[ $TMUX = "" ]] && export TERM="xterm-256color"

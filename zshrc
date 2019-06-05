# User configuration

export PATH="${HOME}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:"

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
    pushd_minus

HISTFILE=~/.histfile
HISTSIZE=500000
SAVEHIST=500000
DIRSTACKSIZE=50
cdpath=(. ~)

fpath=( ${HOME}/.zsh/func ${HOME}/.zsh/completion $fpath )

export EDITOR=vi
export VISUAL=vi

# Load profile
if [[ -r ${HOME}/.profile ]]; then
  source ${HOME}/.profile
fi


bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Global aliases
# alias shopt=':'
# alias _expand=_bash_expand
# alias _complete=_bash_comp

if [ -f $HOME/.aliases ]; then
    source $HOME/.aliases
fi

source ~/.fzf.zsh

# For mux
source ~/.tmuxinator/tmuxinator.zsh
export P4MERGE=p4merge
export LESSGLOBALTAGS=global

if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi

[[ $TMUX = "" ]] && export TERM="xterm-256color"

export RIPGREP_CONFIG_PATH=${HOME}/.ripgreprc

source ~/.purepower
source ~/External/powerlevel10k/powerlevel10k.zsh-theme
source ~/External/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

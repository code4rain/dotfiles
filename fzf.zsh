# Setup fzf
# ---------
if [[ ! "$PATH" == */home/alex.jang/.fzf/bin* ]]; then
  export PATH="$PATH:/home/alex.jang/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */home/alex.jang/.fzf/man* && -d "/home/alex.jang/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/alex.jang/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/alex.jang/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/alex.jang/.fzf/shell/key-bindings.zsh"


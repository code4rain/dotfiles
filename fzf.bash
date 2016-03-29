# Setup fzf
# ---------
if [[ ! "$PATH" == */home/alex/.fzf/bin* ]]; then
  export PATH="$PATH:/home/alex/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */home/alex/.fzf/man* && -d "/home/alex/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/alex/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/alex/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/alex/.fzf/shell/key-bindings.bash"


# Setup fzf
# ---------
if [[ ! "$PATH" == */home/alex.jang/.fzf/bin* ]]; then
  export PATH="$PATH:/home/alex.jang/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/alex.jang/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/alex.jang/.fzf/shell/key-bindings.zsh"


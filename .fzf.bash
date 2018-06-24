# Setup fzf
# ---------
if [[ ! "$PATH" == */home/omar/.fzf/bin* ]]; then
  export PATH="$PATH:/home/omar/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/omar/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/omar/.fzf/shell/key-bindings.bash"


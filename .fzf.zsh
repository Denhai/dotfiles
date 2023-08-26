# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/hayden/dotfiles/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/hayden/dotfiles/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/hayden/dotfiles/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/hayden/dotfiles/fzf/shell/key-bindings.zsh"

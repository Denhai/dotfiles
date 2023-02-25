POSSIBLE_PATH=(
  "~/bin"
  "~/dotfiles/bin"
  # Also added by ~/.fzf.zsh
  "~/dotfiles/fzf/bin"
)

for p in $POSSIBLE_PATH; do
  echo $p
done

export EDITOR="/Applications/Visual Studio Code.app/Contents/MacOS/Electron"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fnm (nvm) https://github.com/Schniz/fnm
eval "$(fnm env --use-on-cd)"
alias nvm="fnm"

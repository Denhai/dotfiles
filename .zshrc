POSSIBLE_PATH=(
  "~/bin"
  "~/dotfiles/bin"
  # Also added by ~/.fzf.zsh
  "~/dotfiles/fzf/bin"
)

for p in $POSSIBLE_PATH; do
  path+=$p
done

export EDITOR="/Applications/Visual Studio Code.app/Contents/MacOS/Electron"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fnm (nvm) https://github.com/Schniz/fnm
eval "$(fnm env --use-on-cd)"
alias nvm="fnm"

# zsh shell hook
eval "$(direnv hook zsh)"

# zsh restore (venv) prompt
setopt PROMPT_SUBST

show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}
PS1='$(show_virtual_env)'$PS1

# Required to load completions
autoload bashcompinit
bashcompinit
autoload compinit
compinit

# Load Angular CLI autocompletion.
if command -v ng >/dev/null 2>&1; then
  source <(ng completion script)
fi

fpath+=~/dotfiles/zsh

autoload fbr fco

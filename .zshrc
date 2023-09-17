# node
export VOLTA_HOME="$HOME/.volta"
# for direnv
export NODE_VERSIONS=$VOLTA_HOME/tools/image/node
export NODE_VERSION_PREFIX=

POSSIBLE_PATH=(
  "~/bin"
  "~/dotfiles/bin"
  # Also added by ~/.fzf.zsh
  "~/dotfiles/fzf/bin"
  "$VOLTA_HOME/bin"
)

for p in $POSSIBLE_PATH; do
  path+=$p
done

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
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

alias g="git"
alias dc="docker compose"

# Gets set to vi mode in VSCode if $EDITOR contains "Vi"sual Studio Code
bindkey -e

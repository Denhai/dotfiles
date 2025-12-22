# node
export VOLTA_HOME="$HOME/.volta"
# for direnv
export NODE_VERSIONS=$VOLTA_HOME/tools/image/node
export NODE_VERSION_PREFIX=

path=(
  $path
  # OSX paths
  "/opt/homebrew/bin"
  "/opt/homebrew/sbin"
  "/opt/homebrew/opt/openjdk@11/bin"
  # Paths
  "$HOME/bin"
  "$HOME/.local/bin"
  "$HOME/dotfiles/bin"
  "$HOME/dotfiles/fzf/bin"
  "$VOLTA_HOME/bin"
  "./node_modules/.bin"
  "$HOME/dev/android/platform-tools"
  "/opt/homebrew/opt/ruby/bin"
)

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# zsh shell hook
eval "$(direnv hook zsh)"

# zsh restore (venv) prompt
setopt PROMPT_SUBST

show_virtual_env() {
  # _OLD_VIRTUAL_PS1 checks if `source venv/bin/activate` has already run (by
  # vscode). This prevents adding (venv) prefix to the prompt twice.
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" && -z "$_OLD_VIRTUAL_PS1" ]]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}
PS1='$(show_virtual_env)'$PS1

# Required to load completions
autoload bashcompinit && bashcompinit
autoload compinit && compinit

# Load Angular CLI autocompletion.
if command -v ng >/dev/null 2>&1; then
  source <(ng completion script)
fi

# Homebrew
if [ -x /opt/homebrew/bin/brew ]; then
  export HOMEBREW_NO_AUTO_UPDATE=1
  eval $(/opt/homebrew/bin/brew shellenv)
fi

fpath+=("$HOME/dotfiles/zsh")
# (:t) removes the path and only keeps the filename, for example it will call `autoload -U fbr` instead of `autoload -U ~/dotfiles/zsh/fbr`
  autoload -U ~/dotfiles/zsh/*(:t)

alias g="git"
alias dc="docker compose"
alias rm="rm -i"

# Gets set to vi mode in VSCode if $EDITOR contains "Vi"sual Studio Code
bindkey -e

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/hayden/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

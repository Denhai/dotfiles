[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_NO_AUTO_UPDATE=1
[ -f $HOME/.cargo/env ] && . "$HOME/.cargo/env"

export HOMEBREW_NO_AUTO_UPDATE=1

[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
[ -f $HOME/.cargo/env ] && . "$HOME/.cargo/env"

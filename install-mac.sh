# https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# https://go.dev/doc/install
# Rosetta was installed while installing go

xcode-select --install

brew install direnv
brew install git

casks=(
  # google-chrome
  onepassword
  vlc
)
brew install --cask $casks

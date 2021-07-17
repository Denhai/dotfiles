# set -U fish_user_paths /usr/lib/go-1.9/bin $fish_user_paths
# universal variables are saved in ~/.config/fish/fishd.(hostname)
set GOPATH $HOME/go
set POSSIBLE_PATH ~/bin ~/dotfiles/bin ~/dotfiles/fzf/bin ./node_modules/.bin ~/.local/bin ~/.rvm/bin $HOME/go $GOPATH/bin $HOME/.cargo/bin $HOME/.rvm/bin ~/Library/Android/sdk/platform-tools /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin
for p in $POSSIBLE_PATH
    if test -d $p
        set -x PATH $PATH $p
    end
end
# path is also changed by files in /etc/profile.d

# set -x PYTHONDONTWRITEBYTECODE 1 # no .pyc files
set -x NVM_DIR ~/dotfiles/nvm
test -f $NVM_DIR/nvm.sh; bass source $NVM_DIR/nvm.sh --no-use ';' nvm use 14 --silent
set -x EDITOR vim

command -sq direnv; and eval (direnv hook fish)

test -e ~/.config/fish/secrets.fish; and source ~/.config/fish/secrets.fish

# `mine` contains the the functions that I've defined and want in source control.
# .config/fish/functions just contains installed symlinks.
set fish_function_path ~/.config/fish/mine $fish_function_path

# Setup z (autojump)
set fish_function_path ~/.config/fish/z/functions $fish_function_path
source ~/.config/fish/z/conf.d/z.fish

alias g git

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
command -sq starship; and starship init fish | source

# Remove the greeting message
set fish_greeting

# set -U fish_user_paths /usr/lib/go-1.9/bin $fish_user_paths
# universal variables are saved in ~/.config/fish/fishd.(hostname)
set GOPATH $HOME/go
set -x GEM_HOME $HOME/.ruby
set OSX_PATH /opt/homebrew/bin /opt/homebrew/sbin
set -x VOLTA_HOME "$HOME/.volta"
set POSSIBLE_PATH ~/bin ~/dotfiles/bin ~/dotfiles/fzf/bin ~/.local/bin $VOLTA_HOME/bin $GOPATH/bin ~/.cargo/bin ~/.rvm/bin $GEM_HOME/bin ~/Library/Android/sdk/platform-tools /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin
for p in $POSSIBLE_PATH $OSX_PATH
    if test -d $p
        # By default it uses -U (univeral), -g (global) simplifies debugging and path removal
        fish_add_path -g $p
    end
end
# path is also changed by files in /etc/profile.d

# set -x PYTHONDONTWRITEBYTECODE 1 # no .pyc files

# for direnv
set -x NODE_VERSIONS $VOLTA_HOME/tools/image/node
set -x NODE_VERSION_PREFIX

set -x EDITOR vim

command -sq direnv; and eval (direnv hook fish)

test -e ~/.config/fish/secrets.fish; and source ~/.config/fish/secrets.fish

# `my_functions` contains the the functions that I've defined and want in source control.
# .config/fish/functions just contains installed symlinks.
set fish_function_path ~/.config/fish/my_functions $fish_function_path

# Setup z (autojump)
set fish_function_path ~/.config/fish/z/functions $fish_function_path
source ~/.config/fish/z/conf.d/z.fish

alias g git
alias docker-compose "docker compose"
alias dc "docker compose"

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
command -sq starship; and starship init fish | source

# Remove the greeting message
set fish_greeting

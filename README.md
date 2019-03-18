# Restore GPG

https://risanb.com/code/backup-restore-gpg-key/

```sh
# Backed up with:
gpg --export-secret-keys --armor > gpg-secret.asc
# gpg --list-secret-keys

# Restore:
gpg --import /path/to/gpg-secret.asc
# Trust:
gpg --edit-key name # Replace "name" with yours
gpg> trust # Choose "ultimate" or other trust level
gpg> save # Save the changes
```

# Setup

```sh
git clone git@github.com:Denhai/dotfiles.git ~/dotfiles
cd ~/dotfiles
git submodule update --init --recursive
apt install git-crypt
git-crypt unlock # need to first, gpg --import
```

# Manual steps

```sh
# https://github.com/junegunn/fzf/blob/master/install
./fzf/install --bin --key-bindings --completion

# https://github.com/Schniz/fnm
curl -fsSL https://fnm.vercel.app/install | bash

# https://app-updates.agilebits.com/product_history/CLI
wget --content-disposition https://cache.agilebits.com/dist/1P/op/pkg/v1.10.0/op_linux_amd64_v1.10.0.zip
unzip op_linux_amd64_v1.10.0.zip -d /tmp/op
mv op/op ~/bin/
```

# How git-crypt was initially set up

```sh
apt install git-crypt
git-crypt init
git-crypt add-gpg-user haybartlett@gmail.com
```
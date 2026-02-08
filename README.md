# When Configuring a New Machine

At minimum:
 
## Configs

```
sudo apt install git
git config --global core.excludesFile '~/.gitignore'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git clone --bare https://github.com/samb0t/dots.git $HOME/.cfg
rm .bashrc
config checkout
config config --local status.showUntrackedFiles no
```

## Vim

```
sudo apt install vim-gtk3
git clone --recurse-submodules https://github.com/samb0t/vimfiles.git .vim
sudo apt install ripgrep
sudo apt install fd-find
sudo apt install universal-ctags
cd <some project dir> ctags -R
```
- Install/configure the fonts in the `extras` directory
- Terminal preferences -> Update font to Consolas Powerline and themes to
  Solarized Dark
- If the recursive submodule install is timing out:
    - Run `git config --global url."https://".insteadOf git://`

## Shell

```
sudo apt install zsh
sudo apt install curl
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)
```
- Connected to AD?
    - Set `default_shell` and `override_shell` to `/bin/zsh` in domain section
      of `/etc/sssd/sssd.conf` - may require restart

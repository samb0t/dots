# When Configuring a New Machine

At minimum:
 
## Configs

```
sudo apt install git
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
sudo apt install rg
sudo apt install fdfind
sudo apt install ctags
cd <some project dir>
ctags -R
```
- Install/configure the fonts in the `extras` directory

## Shell

```
sudo apt install zsh
sudo apt install curl
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)
```

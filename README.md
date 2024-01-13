# Dotfiles

## Dependencies
You will need to install the following dependencies:

`git`

`curl`

`exa`

## Prerequisites
Prior to the installation make sure you have committed the alias to your .bashrc or .zsh:

```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

and that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:

```
echo ".dotfiles" >> .gitignore
```

## To Install:
Now clone my dotfiles into your $HOME by running:

```
curl -Lks https://raw.githubusercontent.com/zyqilla/Dotfiles/main/.local/bin/install-dotfiles | /bin/bash
```

You can install required packages, however that it is specific to Arch Linux.

```
curl -Lks https://raw.githubusercontent.com/zyqilla/Dotfiles/main/.local/bin/install-packages | /bin/bash 
sudo pacman -S "${PKG[@]}" && yay -Sa "${AUR[@]}" --user
```

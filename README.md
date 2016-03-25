# My lovely dotfiles
## Installation
This dotfiles are meant to be used with zsh.

Please fork this repository and configure it for yourself:


```
# if zsh is not installed.
sudo apt-get install zsh
chsh /usr/bin/zsh

git clone --recursive https://github.com/sheerun/dotfiles.git ~/.dotfiles
~/.dotfiles/bin/dotfiles ~/.dotfiles
```

The `dotfiles` command is going to backup your current dotfiles to `~/.dotfiles/backup/${date}`, symlink new ones and generate report.

## Additional download useful tools
```
~/.dotfiles/bin/clone
```

The `clone` command will clone useful tools from each repositories.
* ranger
* tig
* the silver searcher
* oh-my-zsh
* tmux

### Caution
The `clone` command do just clone source.
Should be run `make` & `make install` for each project

## License

This repository is MIT-licensed. You are awesome.
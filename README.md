# My lovely dotfiles
## Installation
This dotfiles are meant to be used with bash and zsh.

Please fork this repository and configure it for yourself:


### Install zsh (Optional)
> if zsh is not installed.
> Recommand.. not requirement
```
sudo apt-get install zsh
chsh /usr/bin/zsh
```

### cloning the repository

```
git clone https://git.sec.samsung.net/alex.jang/dotfiles ~/.dotfiles
```

### Run install command
~/.dotfiles/bin/dotfiles ~/.dotfiles
```

The `dotfiles` command is going to backup your current dotfiles to `~/.dotfiles/backup/${date}`, symlink new ones and generate report.

## Additional download useful tools
```
~/.dotfiles/bin/install.sh
```

The `install` command will clone and build useful tools from each repository.
And make the symbolic link in your  `~/bin`
* ranger
* tig
* oh-my-zsh
* tmux

## License

This repository is MIT-licensed. You are awesome.

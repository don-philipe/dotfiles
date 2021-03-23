# dotfiles

Get dotfiles:

```sh
$ git clone --bare https://github.com/don-philipe/dotfiles.git $HOME/.dotfiles
$ alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
$ dotfiles config --local status.showUntrackedFiles no
$ dotfiles checkout
```

If files are already present one has to delete/backup them.

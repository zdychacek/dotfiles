dotfiles
========

mostly [`mathiasbynens`](https://github.com/mathiasbynens) dotfiles

Clone the repository and update your `~`

```bash
git clone https://github.com/zdychacek/dotfiles.git && cd dotfiles && ./sync.sh
```

To update without confirmation dialog, add -f flag:

```bash
./sync.sh -f
```

To update `~` on custom location, like remote server, add -d flag where value is valid rsync path:

```bash
./sync.sh -f -d myserver:~
```

Put your local settings into `~/.localrc`, this file is not checked into git.
For example that's where you want to put your git config params, because ~/.gitconfig is rewritten on each sync

```
git config --global user.name "your name"
git config --global user.email "your email"
```

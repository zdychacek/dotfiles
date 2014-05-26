dotfiles
========

mostly [`mathiasbynens`](https://github.com/mathiasbynens) dotfiles

Clone the repository and update your `~`

```bash
git clone https://github.com/mkatrenik/dotfiles.git && cd dotfiles && ./sync.sh
```

To update without confirmation dialog, add -f flag:

```bash
./sync.sh -f
```

To update `~` on custom location, like remote server, add -d flag with value valid rsync path:

```bash
./sync.sh -f -d myserver:~
```
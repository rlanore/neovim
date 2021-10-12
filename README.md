# My Neovim container

It's explain how i wrote my neovim config

## Test ouside docker

To do a quick test with nvim 0.5.x

* Clone this repo some where and go into it
* Download an app image verion of neovim [here](https://github.com/neovim/neovim/releases/download/v0.5.1/nvim.appimage)

```bash
chmod u+x nvim.appimage
XDG_DATA_HOME="`pwd`" XDG_CONFIG_HOME="`pwd`" ./nvim.appimage
```

## Nvim tips and tricks

* Open file under cursor

```vim
gf:       Open in new buffer
C-w f gf: Open in hslplit
C-w v gf: Open in vsplit
```


* Show some mappings

```vim
:nmap
:imap
:vmap
```


* Show some config path

```vim
:echo stdpath("config")
:echo stdpath("data")
```


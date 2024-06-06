# dotconfig

Home directory configurations(auto backup)

## Alacritty

- https://alacritty.org/config-alacritty.html

```
cp -r alacritty ~/.config/

```

## Zellij

- https://zellij.dev/documentation/configuration

```
cp -r zellij ~/.config/

```


## Tmux

- read the readme markdown file under tmux folder

## Neovim (for Linux User)

- Download [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim), and place it inside your PATH, I would suggest rename it to `vim`
- when sshed from source box to target box, use vim yank copy text to source box clipboard, you should enable X11 Forward
- example host config inside `~/.ssh/config`
	```
	Host TargetBox
		User xx
		Hostname xxxxxxx
	    	ForwardX11 yes
	```
            

### Vim Coding tips

```
- <leader> is ,
- ,cc ,cs ,cu  # comment and uncomment https://github.com/preservim/nerdcommenter
- c-o for go back
- gn gp  # switch buffer
- C-6 Buffers # Switch recent 2 buffer, List all the Buffers
- C-l C-h C-n  #tab left, right, new
- zR zM  # Markdown fold and unfold
- K # check func doc, double hit to jump into floating box
- % # for jump between parenthesis
- ,F # format code in current window
- gd (definition), gD (declaration), gi(implementation), gr(references) 
- ,rn (rename symbol),  ca (code action: should under virsual mode)
- floaterm related
    - ,ff for trigger find files
    - ,fn for trigger file content grep
- toggleterm 
    - C-t to open a right side term
- AutoRun related
    - ,gi for trigger lazygit
    - ,ap  Run current python file
    - ,ag  Run golang code: go run *.go
    - ,am  Run make
```

### NerdTree tips

```
- t,T for open new tab
- ? for help
- m-p for copy path into clipboard
```

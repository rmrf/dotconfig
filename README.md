# dotconfig

Home directory configurations(auto backup)

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
- <leader>cc, <leader>cs <leader>cu  # comment and uncomment https://github.com/preservim/nerdcommenter
- c-o for go back
- gd, goto func Definition
- gn,gp  # switch buffer
- C-6, Buffers # Switch recent 2 buffer, List all the Buffers
- C-l,C-h,C-n  #tab left, right, new
- zR, zM  # Markdown fold and unfold
- K # check func doc
- % # for jump between parenthesis
- ,F # format code in current window
- gd (definition), gD (declaration), gi(implementation), gr(references) 
- floaterm related
    - `,gi` for trigger lazygit
    - `,ff` for trigger find files
    - `,fn` for trigger file content grep
```

### NerdTree tips

```
- t,T for open new tab
- ? for help
- m-p for copy path into clipboard
```

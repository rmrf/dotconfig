# dotconfig

Home directory configurations(auto backup)

## Tmux

- read the readme markdown file under tmux folder

## Neovim (for Linux User)

- Download [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim), and place it inside your PATH, I would suggest rename it to `vim`
- as root Install Nodejs/yarn: https://nodejs.org
- Install plug.vim
	```
	# inside dotconfig folder
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp neovim/* ~/.config/nvim/
	mkdir -p ~/.config/nvim/plugged; mkdir -p ~/.config/nvim/autoload/
	```
- neovim/vim then `:PlugInstall`
- `cd ~/.local/share/nvim/plugged/coc.nvim/; yarn install`, if have network troulbe , check ~/.npmrc
- `sudo apt-get install fonts-powerline silversearcher-ag` for [powerline](https://github.com/powerline/fonts) and Ag Search
- [gitgutter](https://github.com/airblade/vim-gitgutter) install follow its way.
- [vim-fugitive](https://github.com/tpope/vim-fugitive) for Git related cmd, follow bellow way to install.
	```
	mkdir -p ~/.config/nvim/pack/tpope/start
	cd ~/.config/nvim/pack/tpope/start
	git clone https://tpope.io/vim/fugitive.git
	vim -u NONE -c "helptags fugitive/doc" -c q
	```
- when sshed from source box to target box, use vim yank copy text to source box clipboard, you should enable X11 Forward
- example host config inside `~/.ssh/config`
	```
	Host TargetBox
		User xx
		Hostname xxxxxxx
	    	ForwardX11 yes
	```
- Codeium for code generation
```
:Codeium Auth
```
            

### Vim Coding tips

```
- <leader> is ,
- <leader>cc, <leader>cs <leader>cu  # comment and uncomment https://github.com/preservim/nerdcommenter
- <leader>b, r, t  # golang code Build,Run,Test
- [g, ]g   # go to error position
- C-m, C-a # go code error switch and close
- gd,gy,gi,gr  # c-o for go back
- gn,gp  # switch buffer
- C-6, Buffers # Switch recent 2 buffer, List all the Buffers
- gD  # open Defination window in new Tab (easily switch left and right)
- C-l,C-h,C-n  #tab left, right, new
- zR, zM  # Markdown fold and unfold
- K # check func doc
- % # for jump between parenthesis
- `,rn`  # rename golang val/func name
- Buffers(Bu)  # Browse and Switch Buffers
- Colors  # change colorscheme
- code generation (with codeium on)
    - `c-g` to accept, `c-x` to clear
    - `c-]`, `m-]` to get next/previous suggestion
- floaterm related
    - `,g` for trigger lazygit
    - `,f` for trigger fzf 
    - `,y` for trigger yazi for file management
    - `,c` for trigger codeium ON/OFF
```

### NerdTree tips

```
- t,T for open new tab
- ? for help
- m-p for copy path into clipboard
```

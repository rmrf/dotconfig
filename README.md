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
- `cd ~/.config/nvim/plugged/coc.nvim; yarn install`, if have network troulbe , check ~/.npmrc
- `sudo apt-get install fonts-powerline silversearcher-ag` for [powerline](https://github.com/powerline/fonts) and Ag Search
- [gitgutter](https://github.com/airblade/vim-gitgutter) install follow its way.
- [vim-fugitive](https://github.com/tpope/vim-fugitive) for Git related cmd, follow bellow way to install.
	```
	mkdir -p ~/.config/nvim/pack/tpope/start
	cd ~/.config/nvim/pack/tpope/start
	git clone https://tpope.io/vim/fugitive.git
	vim -u NONE -c "helptags fugitive/doc" -c q
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
- <leader>rn  # rename golang val/func name
- code snips under ~/.config/nvim/plugged/vim-go/gosnippets/UltiSnips/go.snippets
	- C-i # code snip complate
- Files, History, Commits, GFiles? , Maps, Snippets # fzf tips
- Gwrite(Gw), Gcommit, Gblame  # for git operation
- Buffers(Bu)  # Browse and Switch Buffers
- Colors  # change colorscheme
- :Ag # for code search
	- shift + Up/Down for scroll inside the preview window
	- C-/ to switch on/off preview
```

### NerdTree tips

```
- t,T for open new tab
- ? for help
- m-p for copy path into clipboard
```

# dotconfig

Home directory configurations(auto backup)

## Tmux
	- read the readme markdown file under tmux folder

## Neovim
	- Place `init.vim` under `~/.config/nvim/`
	- `:PlugInstall`
	- `sudo apt-get install fonts-powerline silversearcher-ag` for https://github.com/powerline/fonts and Ag
	- [gitgutter](https://github.com/airblade/vim-gitgutter) install follow its way.
	- [vim-fugitive](https://github.com/tpope/vim-fugitive) install follow its way.

### Coding tips
	- <leader>cc, <leader>cs <leader>cu  # comment and uncomment https://github.com/preservim/nerdcommenter
	- <leader>b, r, t  # go code Build,Run,Test
	- C-m, C-a # go code error switch and close
	- [g, ]g   # go to error position
	- gd,gy,gi,gr  # c-o for go back
	- gD  # open Defination window in new Tab
	- C-l,C-h,C-n  #tab left, right, new
	- zR, zM  # Markdown fold and unfold
	- K # check func doc
	- % # for jump between parenthesis
	- <leader>rn  # rename golang val/func name
	- code snips under ~/.config/nvim/plugged/vim-go/gosnippets/UltiSnips/go.snippets
	  - C-i # code snip complate
	- C-V  # preview markdown file in GUI: Need install goneovim 
	- Files, History, Commits, GFiles? , Maps, Snippets # fzf tips
	- Gwrite, Gcommit, Gblame  # for git operation
	- :Ag # for code search
		- shift + Up/Down for scroll inside the preview window

### NerdTree tips
	- t,T for open new tab
	- ? for help
	- m-p for copy path into clipboard


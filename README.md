# dotconfig

Home directory configurations(auto backup)
## Tmux

- need install two plugins:
  - https://github.com/tmux-plugins/tmux-yank
  - https://github.com/tmux-plugins/tmux-resurrect
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

### NVim Coding tips

- When setup new env: 
    - copy `~/.local/share/nvim` folder to new box 
    - copy `~/.local/share/fonts` folder and run `fc-cache -f`
- `cargo install stylua` and place `~/.cargo/bin` inside your `$PATH`
- `:checkhealth` before using nvim
- xxx.hurl, use `:HurlSetEnvFile` to indicate the env file
    - ref for more config: https://hurl.dev/docs/entry.html
- [:Mason](https://github.com/williamboman/mason.nvim) to install lang server


## Ghostty

- https://ghostty.org/docs


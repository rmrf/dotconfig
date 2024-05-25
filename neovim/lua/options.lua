vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"

-- vim.opt.scrolloff = 999
--
vim.g.airline_powerline_fonts = 1

vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"

vim.opt.ignorecase = true
vim.opt.termguicolors = true

vim.g.mapleader = ","

vim.api.nvim_set_keymap("n", "<Leader>F", ":<C-u>Neoformat<CR>", { noremap = true })

-- Nerdtree
vim.api.nvim_set_keymap("n", "<C-e>", ":NERDTreeToggle<CR>", { noremap = true })

vim.g.NERDTreeDirArrowExpandable = "▸"
vim.g.NERDTreeDirArrowCollapsible = "▾"
vim.g.WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = " "
vim.g.webdevicons_conceal_nerdtree_brackets = 1

vim.g.NERDTreeShowLineNumbers = 0
vim.g.NERDTreeAutoCenter = 1
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeWinSize = 31
vim.g.NERDTreeShowBookmarks = 2

vim.g["nerdtree_tabs_open_on_console_startup"] = 1

vim.api.nvim_set_keymap("n", "<C-l>", ":tabnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-h>", ":tabprev<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "gn", ":bnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "gp", ":bprev<CR>", { noremap = true })

-- floaterm
vim.api.nvim_set_keymap("n", "<leader>gi", ":<C-u>FloatermNew --width=0.9 --height=0.9 lazygit<CR>", { noremap = true })


-- for func definition
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

vim.g.neoformat_run_all_formatters = 1
vim.g.neoformat_basic_format_trim = 1
vim.g.neoformat_basic_format_align = 1


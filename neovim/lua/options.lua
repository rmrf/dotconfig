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

-- Format
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
--vim.api.nvim_set_keymap("n", "<leader>gi", "<cmd>FloatermNew --width=0.9 --height=0.9 lazygit<CR>", { noremap = true })

-- AsyncRun
vim.api.nvim_set_keymap("n", "<leader>gi", "<cmd>AsyncRun -mode=term -pos=TAB -close lazygit<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>ap", "<cmd>AsyncRun -mode=term -pos=TAB python3 $(VIM_FILEPATH)<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>ag", "<cmd>AsyncRun -mode=term -pos=TAB go run *.go<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>am", "<cmd>AsyncRun -mode=term -pos=TAB make<CR>", { noremap = true })

-- for func definition
-- Displays hover information about the symbol under the cursor in a floating
-- window. Calling the function twice will jump into the floating window.
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

-- Jumps to the declaration of the symbol under the cursor.
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })

-- Jumps to the definition of the symbol under the cursor.
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

-- Lists all the implementations for the symbol under the cursor in the quickfix window.
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })

-- Lists all the references to the symbol under the cursor in the quickfix window.
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })

-- Renames all references to the symbol under the cursor.
vim.api.nvim_set_keymap("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })

-- Selects a code action available at the current cursor position.
vim.api.nvim_set_keymap("v", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })

vim.g.neoformat_run_all_formatters = 1
vim.g.neoformat_basic_format_trim = 1
vim.g.neoformat_basic_format_align = 1

vim.g.asyncrun_open = 10

-- for lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"rakr/vim-one",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
	},
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight-storm]])
			--vim.cmd([[colorscheme default]])
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"go",
					"python",
					"xml",
					"http",
					"json",
					"graphql",
				},
				auto_install = true,

				highlight = {
					enable = true,
				},

				indent = {
					enable = true,
				},

				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<Leader>ss",
						node_incremental = "<Leader>si",
						scope_incremental = "<Leader>sc",
						node_decremental = "<Leader>sd",
					},
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.clangd.setup({})
			lspconfig.pyright.setup({})
			lspconfig.gopls.setup({})
			lspconfig.java_language_server.setup({})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		end,
	},
	{
		"voldikss/vim-floaterm",
	},
	{
		"preservim/nerdtree",
		dependencies = { "ryanoasis/vim-devicons", "Xuyuanp/nerdtree-git-plugin" },
		config = function() end,
	},
	{
		"sbdchd/neoformat",
		config = function() end,
	},
	-- nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-emoji",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			-- Set up nvim-cmp.
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
						-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
					end,
				},
				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-]>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "vsnip" }, -- For vsnip users.
					{ name = "luasnip" }, -- For luasnip users.
					-- { name = 'ultisnips' }, -- For ultisnips users.
					-- { name = 'snippy' }, -- For snippy users.
				}, {
					{ name = "buffer" },
				}),
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})

			-- Set up lspconfig.
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
			require("lspconfig")["pyright"].setup({
				capabilities = capabilities,
			})
		end,
	},
	{
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup()
		end,
	},
	{
		"Wansmer/treesj",
		keys = { { "<space>j", "<cmd>TSJToggle<cr>", desc = "Join Toggle" } },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = { use_default_keymaps = false, max_join_length = 150 },
	},
	{ "preservim/nerdcommenter" },
	{ "skywind3000/asyncrun.vim" },
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
		opts = {
			rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
		},
	},
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{
		"echasnovski/mini.nvim",
		config = function() end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").get_icons()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup()
		end,
	},
	{ "nvim-neotest/nvim-nio" },
	{
		"jellydn/hurl.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		ft = "hurl",
		opts = {
			-- Show debugging info
			debug = false,
			-- Show notification on run
			show_notification = false,
			-- Show response in popup or split
			mode = "split",
			-- Default formatter
			formatters = {
				json = { "jq" }, -- Make sure you have install jq in your system, e.g: brew install jq
				html = {
					"prettier", -- Make sure you have install prettier in your system, e.g: npm install -g prettier
					"--parser",
					"html",
				},
			},
		},
		keys = {
			-- Run API request
			{ "<leader>H", "<cmd>HurlRunner<CR>", desc = "Run All requests" },
			{ "<leader>h", "<cmd>HurlRunnerAt<CR>", desc = "Run Api request" },
			{ "<leader>te", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
			{ "<leader>tm", "<cmd>HurlToggleMode<CR>", desc = "Hurl Toggle Mode" },
			{ "<leader>tv", "<cmd>HurlVerbose<CR>", desc = "Run Api in verbose mode" },
			-- Run Hurl request in visual mode
			{ "<leader>h", ":HurlRunner<CR>", desc = "Hurl Runner", mode = "v" },
		},
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
		    require("bufferline").setup()
		end,
	},
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && yarn install",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    },
    {
      "yetone/avante.nvim",
      event = "VeryLazy",
      build = "make", -- This is Optional, only if you want to use tiktoken_core to calculate tokens count
      opts = {
            provider="azure",
            azure = {
              endpoint = "https://dogs-jpeast-openai-001.openai.azure.com/", 
              deployment = "gpt-4o", -- Azure deployment name (e.g., "gpt-4o", "my-gpt-4o-deployment")
              api_version = "2024-06-01",
              timeout = 30000, -- Timeout in milliseconds
              temperature = 0,
              max_tokens = 4096,
              ["local"] = false,
            },
      },
      dependencies = {
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below is optional, make sure to setup it properly if you have lazy=true
        {
          'MeanderingProgrammer/render-markdown.nvim',
          opts = {
            file_types = { "markdown", "Avante" },
          },
          ft = { "markdown", "Avante" },
        },
      },
    }

})

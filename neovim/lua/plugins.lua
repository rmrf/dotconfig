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
			-- vim.cmd([[colorscheme tokyonight-storm]])
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
					"dart",
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
			lspconfig.gopls.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              cmd = {"gopls"},
              filetypes = { "go", "gomod", "gowork", "gotmpl" },
              settings = {
                gopls = {
                  analyses = {
                    unusedparams = true,
                  },
                  staticcheck = true,
                  gofumpt = true,
                },
              },
            })
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
            "saadparwaiz1/cmp_luasnip", 
		},

		config = function()
			-- Set up nvim-cmp.
			local cmp = require("cmp")


			cmp.setup({
				snippet = {
					expand = function(args)
                        vim.snippet.expand(arg.body)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
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
					{ name = "path" },
                    { name = 'luasnip' }, -- For luasnip users.
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
        -- 如果没找到，那么使用 :HurlSetEnvFile 设置文件即可
        env_file = { 'hurl.env', },
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
            -- find_env_files_in_folders = utils.find_env_files_in_folders,
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
        "atiladefreitas/dooing",
        config = function()
            require("dooing").setup({
                -- Window settings
                window = {
                    width = 85,         -- Width of the floating window
                    height = 20,        -- Height of the floating window
                    border = 'rounded', -- Border style
                    padding = {
                        top = 1,
                        bottom = 1,
                        left = 2,
                        right = 2,
                    },
                },

            })
        end,
    },
    {
      "mfussenegger/nvim-dap",
      recommended = true,
      desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

      dependencies = {
        "rcarriga/nvim-dap-ui",
        -- virtual text for the debugger
        {
          "theHamsta/nvim-dap-virtual-text",
          opts = {},
        },
      },

      -- stylua: ignore
      keys = {
        { "<leader>d", "", desc = "+debug", mode = {"n", "v"} },
        { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
        { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
        { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
        { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
        { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
        { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
        { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
        { "<leader>dj", function() require("dap").down() end, desc = "Down" },
        { "<leader>dk", function() require("dap").up() end, desc = "Up" },
        { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
        { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
        { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
        { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
        { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
        { "<leader>ds", function() require("dap").session() end, desc = "Session" },
        { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
        { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
      },

      config = function()

        vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

        -- setup dap config by VsCode launch.json file
        local vscode = require("dap.ext.vscode")
        local json = require("plenary.json")
        vscode.json_decode = function(str)
          return vim.json.decode(json.json_strip_comments(str))
        end
      end,
    },
    {
        "leoluz/nvim-dap-go",
		dependencies = "mfussenegger/nvim-dap",
        config = function()
            require("dap-go").setup({

            })
        end,
    },
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "nvim-neotest/nvim-nio" },
      -- stylua: ignore
      keys = {
        { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
        { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
      },
      opts = {},
      config = function(_, opts)
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup(opts)
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open({})
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close({})
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close({})
        end
      end,
    },
    {
      "L3MON4D3/LuaSnip",
      lazy = true,
      dependencies = {
        {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_vscode").load({ paths = { "~/.config/nvim/my-snippets" } }) -- Load snippets from my-snippets folder
          end,
        },
      },
      opts = {
        history = true,
        delete_check_events = "TextChanged",
      },
    },
    {
        'nvim-flutter/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = true,
    },
    {
      "yetone/avante.nvim",
      event = "VeryLazy",
      version = false, -- Never set this value to "*"! Never!
      opts = {
        -- add any opts here
        -- for example
        provider = "gemini",
        openai = {
          endpoint = "https://api.deepseek.com/v1",
          api_key_name = "DEEPSEEK_API_KEY",
          model = "deepseek-chat", -- your desired model (or use gpt-4o, etc.)
          timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
          temperature = 0,
          max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
          --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
        },
        gemini = {
          api_key_name = "GEMINI_API_KEY",
       },
      },
      -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
      build = "make",
      -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "echasnovski/mini.pick", -- for file_selector provider mini.pick
        "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
        "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
        "ibhagwan/fzf-lua", -- for file_selector provider fzf
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua", -- for providers='copilot'
        {
          -- support for image pasting
          "HakonHarnes/img-clip.nvim",
          event = "VeryLazy",
          opts = {
            -- recommended settings
            default = {
              embed_image_as_base64 = false,
              prompt_for_file_name = false,
              drag_and_drop = {
                insert_mode = true,
              },
              -- required for Windows users
              use_absolute_path = true,
            },
          },
        },
        {
          -- Make sure to set this up properly if you have lazy=true
          'MeanderingProgrammer/render-markdown.nvim',
          opts = {
            file_types = { "markdown", "Avante" },
          },
          ft = { "markdown", "Avante" },
        },
      },
    }

})

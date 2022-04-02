---@diagnostic disable: different-requires

-- Install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PackerBootstrap = vim.fn.execute("!git clone --depth 1 https://github.com/wbthomason/packer.nvim " .. install_path)
	vim.cmd [[ packadd packer.nvim ]]
end

vim.cmd [[cnoreabbrev pc PackerCompile]]
vim.cmd [[cnoreabbrev ps PackerSync]]
vim.cmd [[cnoreabbrev pst PackerStatus]]

-- Require packer_compiled
pcall(require, "packer_compiled")

return require("packer").startup {
	function()
		use {
			-- Some indispensable plugins
			{
				"wbthomason/packer.nvim",
				"nvim-lua/plenary.nvim",
				"tpope/vim-repeat",
				"tpope/vim-surround",
				{
					"tpope/vim-fugitive",
					config = function()
						vim.keymap.set("n", "<leader>gg", "<cmd>G<cr>", { silent = true })
						vim.cmd [[cnoreabbrev g Git]]
					end,
				},
				{
					"tpope/vim-eunuch",
					cmd = { "SudoWrite" },
					vim.keymap.set("n", "<leader>sf", "<cmd>SudoWrite<cr>", { silent = true }),
				},
			},

			-- Improve startup time
			{
				"lewis6991/impatient.nvim",
				config = function()
					require "impatient"
				end,
			},

			-- Ui
			{
				{
					"sainnhe/gruvbox-material",
					event = "VimEnter",
					requires = {
						"sainnhe/edge",
						"rebelot/kanagawa.nvim",
						"Mofiqul/vscode.nvim",
					},
					config = function()
						require "plugins.configs.color"
					end,
				},
				{
					"kyazdani42/nvim-web-devicons",
					after = "gruvbox-material",
				},
				{
					"nvim-lualine/lualine.nvim",
					opt = true,
					after = "gruvbox-material",
					config = function()
						require("plugins.configs.others").lualine()
					end,
				},
				{
					"akinsho/bufferline.nvim",
					opt = true,
					event = "BufHidden",
					config = function()
						require("plugins.configs.others").bufferline()
					end,
				},
				{
					"folke/zen-mode.nvim",
					opt = true,
					cmd = "ZenMode",
					config = function()
						vim.keymap.set("n", "<leader>tz", "<cmd>ZenMode<cr>", { silent = true })
					end,
				},
			},

			-- Treesitter
			{
				{
					"nvim-treesitter/nvim-treesitter",
					ft = tsFileTypes,
					requires = {
						{
							"nvim-treesitter/playground",
							cmd = {
								"TSPlaygroundToggle",
								"TSHighlightCapturesUnderCursor",
							},
							after = "nvim-treesitter",
						},
						{
							"nvim-treesitter/nvim-treesitter-textobjects",
							after = "nvim-treesitter",
						},
					},
					config = function()
						require "plugins.configs.treesitter"
					end,
				},
				{
					"windwp/nvim-ts-autotag",
					opt = true,
					after = "nvim-treesitter",
					ft = {
						"html",
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"typescriptcommon",
						"vue",
					},
				},
				{
					"p00f/nvim-ts-rainbow",
					opt = true,
					after = "nvim-treesitter",
				},
				{
					"m-demare/hlargs.nvim",
					ft = tsFileTypes,
					after = "nvim-treesitter",
					config = function()
						require("hlargs").setup()
					end,
				},
				{
					"abecodes/tabout.nvim",
					after = "nvim-treesitter",
					config = function()
						require("tabout").setup {
							completion = false,
							ignore_beginning = false,
						}
					end,
				},
			},

			-- Telescope
			{
				"nvim-telescope/telescope.nvim",
				module = "telescope",
				event = "VimEnter",
				requires = {
					{
						"nvim-telescope/telescope-fzf-native.nvim",
						run = "make all",
					},
					"nvim-telescope/telescope-symbols.nvim",
					"jvgrootveld/telescope-zoxide",
					{ "AckslD/nvim-neoclip.lua", requires = { { "tami5/sqlite.lua", module = "sqlite" } } },
				},
				config = function()
					require "plugins.configs.telescope"
				end,
			},

			-- Some useful plugins, but not indispensable.
			{
				{
					"jghauser/mkdir.nvim",
					event = "BufWritePre",
				},
				{
					"mbbill/undotree",
					cmd = "UndotreeToggle",
					event = "BufRead",
					config = function()
						vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { silent = true })
					end,
				},
				{
					"phaazon/hop.nvim",
					event = "BufRead",
					config = function()
						require("plugins.configs.others").hop()
					end,
				},
				{
					"windwp/nvim-autopairs",
					ft = lspLangs,
					after = "nvim-cmp",
					config = function()
						require("plugins.configs.others").autopairs()
					end,
				},
				{
					"numToStr/Comment.nvim",
					config = function()
						require("Comment").setup()
					end,
				},
				{
					"nacro90/numb.nvim",
					event = "BufRead",
					config = function()
						require("numb").setup {
							show_numbers = true,
							show_cursorline = true,
							number_only = false,
						}
					end,
				},
				{
					"norcalli/nvim-colorizer.lua",
					config = function()
						require("plugins.configs.others").colorizer()
					end,
				},
				{
					"folke/todo-comments.nvim",
					event = "BufRead",
					config = function()
						require("plugins.configs.others").todo_comments()
					end,
				},

				-- Marks
				{
					"chentau/marks.nvim",
					event = "BufRead",
					config = function()
						require("plugins.configs.others").marks()
					end,
				},
				{
					"ThePrimeagen/harpoon",
					opt = true,
					event = "BufRead",
					config = function()
						require("plugins.configs.others").harpoon()
					end,
				},
			},

			-- Snippets
			{
				{
					"rafamadriz/friendly-snippets",
					evert = "InsertCharPre",
					ft = lspLangs,
				},
				{
					"L3MON4D3/LuaSnip",
					ft = lspLangs,
					after = "nvim-cmp",
					wants = "friendly-snippets",
					config = function()
						require("plugins.configs.others").luasnip()
					end,
				},
			},

			-- Cmp
			{
				{
					"hrsh7th/nvim-cmp",
					branch = "dev",
					ft = lspLangs,
					config = function()
						require "plugins.configs.cmp"
					end,
				},
				{
					"saadparwaiz1/cmp_luasnip",
					ft = lspLangs,
					after = "LuaSnip",
				},
				{
					"hrsh7th/cmp-nvim-lua",
					ft = lspLangs,

					after = "cmp_luasnip",
				},
				{
					"hrsh7th/cmp-nvim-lsp",
					ft = lspLangs,

					after = "cmp-nvim-lua",
				},
				{
					"hrsh7th/cmp-buffer",
					ft = lspLangs,

					after = "cmp-nvim-lsp",
				},
				{
					"tzachar/cmp-tabnine",
					ft = lspLangs,

					after = "cmp-nvim-lsp",
					run = "./install.sh",
				},
				{
					"hrsh7th/cmp-path",
					ft = lspLangs,

					after = "cmp-buffer",
				},
				{
					"andersevenrud/cmp-tmux",
					ft = lspLangs,

					after = "cmp-buffer",
				},
			},

			-- Lsp stuff
			{
				{
					"ray-x/navigator.lua",
					ft = lspLangs,
					requires = {
						{ "ray-x/guihua.lua", run = "cd lua/fzy && make" },
						"neovim/nvim-lspconfig",
					},
					config = function()
						require "plugins.configs.lspconfig"
					end,
				},
				{
					"ray-x/lsp_signature.nvim",
					ft = lspLangs,
					config = function()
						require("plugins.configs.others").signature()
					end,
				},
				{
					"folke/trouble.nvim",
					ft = lspLangs,
					config = function()
						require("plugins.configs.others").trouble()
					end,
				},
				{
					"jose-elias-alvarez/null-ls.nvim",
					event = { "BufRead", "InsertEnter" },
					config = function()
						require("plugins.configs.others").null_ls()
					end,
				},
			},

			-- nvim-dap
			{
				{
					"mfussenegger/nvim-dap",
					ft = lspLangs,
				},
				{
					"rcarriga/nvim-dap-ui",
					ft = lspLangs,
					after = "nvim-dap",
				},
			},

			{
				-- Go
				{
					"ray-x/go.nvim",
					ft = "go",
					after = "navigator.lua",
					config = function()
						require("plugins.configs.lspconfig").go()
					end,
				},

				-- Rust
				{
					"simrat39/rust-tools.nvim",
					ft = "rust",
					after = "navigator.lua",
					config = function()
						require("plugins.configs.lspconfig").rust()
					end,
				},

				-- LaTeX
				{
					"lervag/vimtex",
					ft = "tex",
					config = function()
						vim.g.vimtex_view_method = "zathura"
					end,
				},
			},

			-- Etc
			{
				{
					"akinsho/toggleterm.nvim",
					opt = true,
					event = "BufWinEnter",
					config = function()
						require "plugins.configs.term"
					end,
				},
				{
					"iamcco/markdown-preview.nvim",
					opt = true,
					ft = "markdown",
					run = "cd app && yarn install",
				},
				{
					"jbyuki/venn.nvim",
					opt = true,
					event = "BufRead",
					config = function()
						require("plugins.configs.others").venn()
					end,
				},
				{
					"jbyuki/nabla.nvim",
					opt = true,
					ft = { "tex", "markdown" },
					config = function()
						require("plugins.configs.others").nabla()
					end,
				},
			},
		}
		if PackerBootstrap then
			require("packer").sync()
		end
	end,

	config = {
		compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
		display = {
			open_fn = function()
				return require("packer.util").float { border = "single" }
			end,
		},
	},
}

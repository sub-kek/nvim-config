local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git" 
  vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath, })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
	},
	{ "williamboman/mason.nvim" },
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"rafamadriz/friendly-snippets",

			{
				"L3MON4D3/LuaSnip",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},

			{
				"windwp/nvim-autopairs",
				config = function()
					require("nvim-autopairs").setup()

					local cmp_autopairs = require "nvim-autopairs.completion.cmp"
					local cmp = require "cmp"
					cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},
		},
	},
	{ "stevearc/conform.nvim" },
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{
		"lewis6991/gitsigns.nvim",
		config = function ()
			require("gitsigns").setup{}
		end,
	},
	{
		"akinsho/bufferline.nvim",
    event = "BufReadPre",
	},
	{ "echasnovski/mini.statusline" },
}

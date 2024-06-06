local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {
	settings = {
		Lua = {
			diagnotics = {
				globals = { "vim", },
			},
			workspace = {
				library = {
						vim.fn.expand "$VIMRUNTIME/lua",
            vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
						vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
				},
			},
		},
	},
}

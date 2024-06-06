require("nvim-tree").setup {
	filters = {
    enable = false,
  },
	git = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
	},
	diagnostics = {
		enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint = "",
      error = "",
    },
	},
}

require("nvim-treesitter.configs").setup{
	ensure_installed = {
		"vim",
		"bash",
		"c",
		"c_sharp",
		"cpp",
		"javascript",
		"typescript",
		"json",
		"lua",
		"python",
		"css",
		"rust",
		"markdown",
		"java",
		"go",
		"vue",
	},
	highlight = { enable = true },
}

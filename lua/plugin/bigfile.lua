require("bigfile").setup({
	filesize = 1,
	pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
	features = { -- features to disable
		"indent_blankline",
		"illuminate",
		"lsp",
		"treesitter",
		"syntax",
		"matchparen",
		"vimopts",
		"filetype",
	},
})

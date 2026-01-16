local tresitter_list = {
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
	"scss",
	"rust",
	"dart",
	"markdown",
	"java",
	"go",
	"gosum",
	"gomod",
	"vue",
	"sql",
	"kotlin",
	"hyprlang",
	"yaml",
	"dockerfile",
	"desktop",
}
--上流哪个神人整出来的break change，还得专门整这么多行才能高亮
vim.api.nvim_create_autocmd("FileType", {
	pattern = tresitter_list,
	callback = function()
		vim.treesitter.start()
		-- vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		-- vim.wo[0][0].foldmethod = "expr"
		-- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
require("nvim-treesitter").install(tresitter_list)

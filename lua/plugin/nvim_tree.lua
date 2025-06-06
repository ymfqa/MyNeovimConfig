-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup({
	--默认显示.gitignore的文件
	filters = { git_ignored = false },
})
require("nvim-web-devicons").setup()

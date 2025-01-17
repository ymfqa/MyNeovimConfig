local vim = vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

--插件列表
local plugins = {
	"folke/tokyonight.nvim", -- 主题
	"nvim-lualine/lualine.nvim", -- 状态栏
	"nvim-tree/nvim-tree.lua", -- 文档树
	"nvim-tree/nvim-web-devicons", --文档树图标
	"alexghergh/nvim-tmux-navigation", --模拟tmux窗口移动
	"HiPhish/rainbow-delimiters.nvim", --彩虹括号
	"stevearc/dressing.nvim", --nvim-tree美化新建和重命名文件界面
	"lewis6991/gitsigns.nvim", -- 左则git提示
	"stevearc/conform.nvim", --格式化代码插件
	"numToStr/Comment.nvim", --注释代码插件
	"max397574/colortils.nvim", --显示颜色
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, --语法高亮
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" }, --标签页
	--lsp三件套
	{
		"williamboman/mason.nvim", --安装lsp服务
		"williamboman/mason-lspconfig.nvim", -- 这个相当于mason.nvim和lspconfig的桥梁
		"neovim/nvim-lspconfig", --配置lsp服务
	},
	--cmp三件套
	{
		"hrsh7th/nvim-cmp", --cmp自动补全
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
	},
	{
		"L3MON4D3/LuaSnip", --代码片段,cmp默认补全的东西
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	"saadparwaiz1/cmp_luasnip", --cmp和luasnip的桥梁
	--fzf两件套
	{ "junegunn/fzf", build = "./install --bin" }, --fzf_lua前置插件
	{
		"ibhagwan/fzf-lua", --fzf文件搜索插件
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("fzf-lua").setup({})
		end,
	},
	{
		"windwp/nvim-autopairs", --括号自动补全
		event = "InsertEnter",
		config = true,
	},
	{
		"nvimdev/dashboard-nvim", --开始页
		event = "VimEnter",
		opts = require("plugin.dashboard"),
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{
		"folke/which-key.nvim", --查看快捷键
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},
	{
		"folke/noice.nvim", --通知插件,兼顾命令行美化
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim", --md预览
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
	},
	{
		"kevinhwang91/nvim-ufo", --折叠代码插件
		dependencies = {
			"kevinhwang91/promise-async",
		},
	},
	{
		"LunarVim/bigfile.nvim", --大文件自动禁用lsp等东西
	},
	{
		"lukas-reineke/indent-blankline.nvim", --缩进线美化插件
		main = "ibl",
		opts = {},
	},
}

-- 启动 lazy.nvim
require("lazy").setup(plugins, {})

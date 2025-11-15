-- 启动mason
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
require("mason-lspconfig").setup({
	automatic_enable = false,
})
-- 检查必要的lsp和formatter安装了没有,没安装就安上
local lsp_list = {
	"lua_ls",
	"pyright",
	"cssls",
	"clangd",
	"rust_analyzer",
	"jdtls",
	"html",
	"omnisharp",
	"tailwindcss",
	"gopls",
	"dockerls",
	"vue_ls",
	"vtsls",
	"dartls",
	"hyprls",
	"qmlls",
	"somesass_ls",
}
local ensure_list = {
	--语言服务器
	"lua-language-server",
	"pyright",
	"css-lsp",
	"clangd",
	"rust-analyzer",
	"jdtls",
	"html-lsp",
	"omnisharp",
	"tailwindcss-language-server",
	"gopls",
	"dockerfile-language-server",
	"vue-language-server",
	"vtsls",
	"hyprls",
	"some-sass-language-server",
	"qmlls",
	--格式化程序
	"black",
	"stylua",
	"prettier",
	"rustfmt",
	"fixjson",
	"xmlformatter",
	"yamlfmt",
	"gofumpt",
	"clang-format",
}
local function install()
	local mr = require("mason-registry")
	-- local mason_list = mr.get_all_package_specs()
	for _, v in pairs(ensure_list) do
		if not (mr.get_package(v):is_installed() or mr.get_package(v):is_installing()) then
			vim.cmd("MasonInstall " .. v)
		end
	end
	mr = nil
end
-- 可选择自动安装还是手动安装
if require("basic.config").data["lsp_install"] then
	install()
end
-- 对vue进行详细配置,sb vue的lsp,不配用不了
vim.lsp.config("vtsls", {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					{
						name = "@vue/typescript-plugin",
						location = vim.fn.stdpath("data")
							.. "/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin",
						languages = { "vue" },
						configNamespace = "typescript",
					},
				},
			},
		},
	},
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})
--flutter和dart配置
vim.lsp.config("dartls", {
	cmd = { "dart", "language-server", "--protocol=lsp" }, -- Dart SDK 提供的 LSP
	init_options = {
		closingLabels = true, -- 显示闭合标签
		flutterOutline = true, -- 启用 Flutter 大纲
		onlyAnalyzeProjectsWithOpenFiles = false,
	},
	filetypes = { "dart" },
})
--给django配上
vim.lsp.config("html", {
	filetypes = { "html", "htmldjango", "htm" },
})
--qml配置上导入路径
vim.lsp.config("qmlls", {
	cmd = { "qmlls", "-I", "/usr/lib/qt6/qml" },
})

--启动所有的lsp
for _, i in pairs(lsp_list) do
	vim.lsp.enable(i)
end

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
	ensure_installed = {
		-- 以下为语言服务器应用
		"lua-language-server",
		"pyright",
		"css-lsp",
		"clangd",
		"rust-analyzer",
		"jdtls",
		"html-lsp",
		"typescript-language-server",
		"omnisharp",
		"tailwindcss-language-server",
		"gopls",
		"dockerls",
		-- "volar",-- 新版mason给volar删了,看以后会不会加回来吧
		-- 以下为格式化应用,格式化应用使用这个安装似乎有问题
		-- "stylua",
		-- "prettier",
		-- "black",
		-- "fixjson",
		-- "rustfmt",
		-- "xmlformat",
		-- "gofumpt",
		-- "astyle",-- mason一直没给这个加进去,希望以后加
	},
})
local capabilities = require("cmp_nvim_lsp").default_capabilities() --导入cmp默认配置
require("lspconfig").lua_ls.setup({ capabilities = capabilities })

require("lspconfig").pyright.setup({})

require("lspconfig").cssls.setup({
	filetypes = { "css", "sass", "scss" },
})

require("lspconfig").clangd.setup({})

require("lspconfig").rust_analyzer.setup({})

require("lspconfig").jdtls.setup({})

capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require("lspconfig").html.setup({
	capabilities = capabilities,
})

require("lspconfig").ts_ls.setup({
	filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
})

require("lspconfig").volar.setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	init_options = {
		vue = {
			hybridMode = false,
		},
	},
})

require("lspconfig").tailwindcss.setup({})

require("lspconfig").omnisharp.setup({})

require("lspconfig").gopls.setup({})

require("lspconfig").dockerls.setup({})

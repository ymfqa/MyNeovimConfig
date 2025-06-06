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
		"lua_ls",
		"pyright",
		"cssls",
		"clangd",
		"rust_analyzer",
		"jdtls",
		"html",
		"volar",
		"ts_ls",
		"omnisharp",
		"tailwindcss",
		"gopls",
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

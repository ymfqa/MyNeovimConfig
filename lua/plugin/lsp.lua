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
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities() --导入cmp默认配置
require("lspconfig").lua_ls.setup({ capabilities = capabilities })

require("lspconfig").pyright.setup({})

-- 确保从 nvim-cmp 注入补全能力（关键步骤！）
capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").cssls.setup({
	capabilities = capabilities, -- 必须传递此参数
	root_dir = require("lspconfig.util").root_pattern(".git", "package.json"),
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

-- 禁用 Tailwind 对纯 CSS 文件的支持
require("lspconfig").tailwindcss.setup({
	filetypes = {
		"html",
		"javascriptreact",
		"typescriptreact",
		"vue",
		"svelte",
	},
})

require("lspconfig").omnisharp.setup({})

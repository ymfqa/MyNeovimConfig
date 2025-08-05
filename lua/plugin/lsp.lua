require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

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
}
require("mason-lspconfig").setup({
	automatic_enable = false,
	ensure_installed = lsp_list,
})
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
vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = false,
			},
		},
	},
})
for _, i in pairs(lsp_list) do
	vim.lsp.enable(i)
end

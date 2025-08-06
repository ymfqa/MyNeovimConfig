require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		html = { "prettier" },
		vue = { "prettier" },
		yaml = { "yamlfmt" },
		java = { "clang-format" },
		cpp = { "clang-format" },
		c = { "clang-format" },
		cs = { "clang-format" },
		json = { "fixjson" },
		jsonc = { "fixjson" },
		rust = { "rustfmt" },
		xml = { "xmlformat" },
		go = { "gofumpt" },
	},
	format_on_save = {
		timeout_ms = 3000,
	},
	stop_after_first = true,
})

-- 缩进2个空格的,改成4个
require("conform").formatters.prettier = {
	prepend_args = {
		"--tab-width",
		"4",
	},
}
require("conform").formatters["clang-format"] = {
	prepend_args = {
		"--style",
		"{BasedOnStyle: Google , IndentWidth: 4}",
	},
}

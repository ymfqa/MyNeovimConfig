require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		html = { "prettier" },
		vue = { "prettier" },
		java = { "astyle" },
		cpp = { "astyle" },
		c = { "astyle" },
		cs = { "astyle" },
		json = { "fixjson" },
		rust = { "rustfmt" },
		xml = { "xmlformat" },
	},
	format_on_save = {
		timeout_ms = 3000,
	},
	stop_after_first = true,
})

require("conform").formatters.prettier = {
	args = function()
		local filetype = vim.bo.filetype
		local parser = "babel"
		if filetype == "vue" then
			parser = "vue"
		elseif filetype == "typescript" or filetype == "javascript" then
			parser = "babel"
		elseif filetype == "html" then
			parser = "html"
		end
		return {
			"--tab-width",
			"4",
			"--parser",
			parser,
			"--html-whitespace-sensitivity",
			"ignore", -- 忽略 HTML 中的空白符
		}
	end,
}

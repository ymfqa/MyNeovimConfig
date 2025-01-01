require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		javascript = { "prettier" },
		typescript = { "prettier" },
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
})

require("conform").formatters.prettier = {
	args = function()
		local filetype = vim.bo.filetype
		local parser = "babel"
		if filetype == "vue" then
			parser = "vue"
		elseif filetype == "typescript" or filetype == "javascript" then
			parser = "babel"
		end
		return {
			"--tab-width",
			"4",
			"--parser",
			parser,
		}
	end,
}

local options = {
	"nord",
	"tokyonight",
	"synthwave84",
}

local M = {}

local function choose_theme(theme)
	if theme == "tokyonight" then
		require("tokyonight").setup({
			style = "moon",
		})
		vim.cmd([[colorscheme tokyonight]])
	elseif theme == "synthwave84" then
		require("synthwave84").setup({
			glow = {
				error_msg = true,
				type2 = true,
				func = true,
				keyword = true,
				operator = false,
				buffer_current_target = true,
				buffer_visible_target = true,
				buffer_inactive_target = true,
			},
		})
		vim.cmd([[colorscheme synthwave84]])
	elseif theme == "nord" then
		require("nord").setup({})
		vim.cmd([[colorscheme nord]])
	end
end

function M.choose_theme()
	vim.ui.select(options, {
		prompt = "Theme:",
		format_item = function(item)
			return item
		end,
	}, choose_theme)
end
choose_theme("nord")
return M

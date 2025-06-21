local options = {
	"nord",
	"tokyonight",
	"tokyonight-night",
	"synthwave84",
	"rose-pine",
	"rose-pine-moon",
	"fluoromachine",
	"palenightfall",
	"onedark",
	"vaporwave",
	"catppuccin-latte",
	"catppuccin-frappe",
	"catppuccin-macchiato",
	"catppuccin-mocha",
}

local M = {}

local function choose_theme(theme)
	vim.cmd("colorscheme " .. theme)
end

function M.choose_theme()
	vim.ui.select(options, {
		prompt = "Theme:",
		format_item = function(item)
			return item
		end,
	}, choose_theme)
end
choose_theme("tokyonight")
return M

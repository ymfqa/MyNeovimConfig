return function()
	local logo = [[
                                __ _._.,._.__
                          .o8888888888888888P'
                        .d88888888888888888K
          ,8            888888888888888888888boo._
         :88b           888888888888888888888888888b.
          `Y8b          88888888888888888888888888888b.
            `Yb.       d8888888888888888888888888888888b
              `Yb.___.88888888888888888888888888888888888b
                `Y888888888888888888888888888888CG88888P"'
                  `88888888888888888888888888888MM88P"'
 "Y888K    "Y8P""Y888888888888888888888888oo._""""
   88888b    8    8888`Y88888888888888888888888oo.
   8"Y8888b  8    8888  ,8888888888888888888888888o,
   8  "Y8888b8    8888""Y8`Y8888888888888888888888b.
   8    "Y8888    8888   Y  `Y8888888888888888888888
   8      "Y88    8888     .d `Y88888888888888888888b
 .d8b.      "8  .d8888b..d88P   `Y88888888888888888888
                                  `Y88888888888888888b.
                   "Y888P""Y8b. "Y888888888888888888888
                     888    888   Y888`Y888888888888888
                     888   d88P    Y88b `Y8888888888888
                     888"Y88K"      Y88b dPY8888888888P
                     888  Y88b       Y88dP  `Y88888888b
                     888   Y88b       Y8P     `Y8888888
                   .d888b.  Y88b.      Y        `Y88888
                                                  `Y88K
                                                    `Y8
                                                      '
			]]
	local which_os = io.popen("uname"):read("*a")
	local opts
	local isLinux = string.find(which_os, "Linux")
	opts = {
		theme = "doom",
		hide = {
			statusline = false,
		},
		config = {
			header = vim.split(logo, "\n"),
			center = {
				{
					action = "ene | startinsert",
					desc = " New file",
					icon = " ",
					key = "n",
				},
				{
					action = ":lua require('fzf-lua').oldfiles()",
					desc = " Recent files",
					icon = " ",
					key = "r",
				},
				{
					action = ":lua require('fzf-lua').files()",
					desc = " Find File",
					icon = " ",
					key = "c",
				},
				{
					action = (isLinux and { "e ~/.config/nvim/" } or { "e C:\\Users\\ASUS\\AppData\\Local\\nvim" })[1],
					desc = " Config File",
					icon = " ",
					key = "c",
				},
				{
					action = "Lazy",
					desc = " Lazy",
					icon = "󰒲 ",
					key = "l",
				},
				{
					action = "Mason",
					desc = " Mason",
					icon = "M ",
					key = "m",
				},
				{
					action = "qa",
					desc = " Quit",
					icon = " ",
					key = "q",
				},
			},
			footer = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				return {
					"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
				}
			end,
		},
	}
	for _, button in ipairs(opts.config.center) do
		button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
		button.key_format = "  %s"
	end

	-- close Lazy and re-open when the dashboard is ready
	if vim.o.filetype == "lazy" then
		vim.cmd.close()
		vim.api.nvim_create_autocmd("User", {
			pattern = "DashboardLoaded",
			callback = function()
				require("lazy").show()
			end,
		})
	end

	return opts
end

local M = {}

local vim = vim

function M.open_config()
	return function()
		local which_os = io.popen("uname"):read("*a")
		local isLinux = string.find(which_os, "Linux")
		if isLinux then
			vim.cmd("e ~/.config/nvim/")
		else
			vim.cmd("e ~/AppData/Local/nvim/")
		end
	end
end

return M

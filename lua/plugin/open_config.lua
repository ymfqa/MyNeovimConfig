local M = {}

local vim = vim

function M.open_config()
	return function()
		local which_os = vim.fn.has("unix")
		if which_os ~= 0 then
			vim.cmd("e ~/.config/nvim/")
		else
			vim.cmd("e ~/AppData/Local/nvim/")
		end
	end
end

return M

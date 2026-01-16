local sep = "\\"
if vim.fn.has("unix") then
	sep = "/"
end
local M = {}
M.data = {}
function M.read_config()
	local file = io.open(vim.fn.stdpath("config") .. sep .. "config.json", "r")
	if not file then
		print("打开file失败:", vim.fn.stdpath("config") .. sep .. "config.json")
		return
	end
	local content = file:read("a")
	file:close()
	local data = vim.json.decode(content)
	M.data = data
end
M.read_config()
return M

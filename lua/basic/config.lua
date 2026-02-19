local sep = "\\"
if vim.fn.has("unix") then
	sep = "/"
end
local M = {}
--存配置数据的
M.data = {}
--读取配置
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
--实际调用
M.read_config()
--读取环境变量
if M.data.env then
	for key, value in pairs(M.data.env) do
		vim.fn.setenv(key,value)
	end
end
return M

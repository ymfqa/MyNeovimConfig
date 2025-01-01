local vim = vim
-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"
-- jk移动时光标下上方保留4行
vim.o.scrolloff = 4
vim.o.sidescrolloff = 4
-- 使用绝对行号
vim.wo.number = true
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 缩进4个空格等于一个Tab
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
-- 使用增强状态栏后不再需要 vim 的模式提示
vim.o.showmode = false
-- 禁止折行
vim.o.wrap = false
vim.wo.wrap = false
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 补全增强
vim.o.wildmenu = true
-- 启用鼠标
vim.opt.mouse:append("a")
-- 系统剪贴板
vim.opt.clipboard:append("unnamedplus")
-- 外观
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
--判断操作系统并更改默认终端
local which_os = io.popen("uname"):read("*a")
if string.find(which_os, "MSYS") then
	vim.opt.shell = "pwsh.exe -nologo"
end
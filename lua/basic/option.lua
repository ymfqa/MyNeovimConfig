local vim = vim
-- 简体中文设置(取消下面三行注释即可)
-- vim.g.vimcdoc_zh_cn = 1 -- 强制使用简体中文
-- vim.opt.langmenu = "zh_CN.UTF-8" -- 菜单语言
-- vim.cmd("language mes zh_CN.UTF-8") -- 错误提示语言
-- utf8
vim.opt.fileencoding = "utf-8" -- 设置文件保存编码为 UTF-8
vim.opt.encoding = "utf-8" -- 设置 Neovim 内部编码为 UTF-8
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
--设置历史文件数量
--'1000：将最近文件记录的最大数量增加到 1000 条。
-- <50：保存小于 50 KB 的寄存器内容。
-- s10：保存 10 KB 的搜索历史。
-- h：禁用高亮历史记录（可选）。
vim.o.shada = "'1000,<50,s10,h"
--判断操作系统并更改默认终端
local which_os = vim.fn.has("unix")
-- 看是不是win
if which_os == 0 then
	vim.opt.shell = "pwsh.exe"
end
-- win在退出时删除shada.tmp.x
vim.api.nvim_create_autocmd("VimLeavePre", {
	pattern = "*",
	callback = function()
		-- 看是不是win
		if which_os == 0 then
			local file_path = os.getenv("LOCALAPPDATA") .. "\\nvim-data\\shada\\main.shada.tmp.x"
			-- 看文件是否存在
			local file_exist = io.open(file_path, "rb")
			if file_exist then
				file_exist:close()
				os.remove(file_path)
			end
		end
	end,
})

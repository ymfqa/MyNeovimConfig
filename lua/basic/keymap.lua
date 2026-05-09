local vim = vim
vim.g.mapleader = " "
local fzf = require("fzf-lua")
local nvim_tmux = require("nvim-tmux-navigation")
local run_code = require("plugin.run_code")
local open_config = require("plugin.open_config")
local choose_theme = require("plugin.theme")
-- 窗口
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "水平分割窗口" }) -- 水平新增窗口
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "垂直分割窗口" }) -- 垂直新增窗口
-- 取消高亮
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "取消高亮" })
--保存
vim.keymap.set("n", "<C-s>", ":w!<CR>", { desc = "保存" })
--格式化
vim.keymap.set("n", "<leader>fc", require("conform").format, { desc = "格式化" })
--打开mason
vim.keymap.set("n", "<leader>ms", ":Mason<CR>", { desc = "打开mason" })
--打开lazy.nvim
vim.keymap.set("n", "<leader>ly", ":Lazy<CR>", { desc = "打开lazy界面" })
--打开nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "切换nvim-tree打开状态" })
--切换butterline
vim.keymap.set("n", "<S-L>", ":bnext<CR>", { desc = "切换到下一标签页" })
vim.keymap.set("n", "<S-H>", ":bprevious<CR>", { desc = "切换到上一标签页" })
vim.keymap.set("n", "<S-Right>", ":bnext<CR>", { desc = "切换到下一标签页" })
vim.keymap.set("n", "<S-Left>", ":bprevious<CR>", { desc = "切换到上一标签页" })
--跳转错误
vim.keymap.set("n", "<S-K>", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "跳转到上一错误/警告" })
vim.keymap.set("n", "<S-J>", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "跳转到下一错误/警告" })
vim.keymap.set("n", "<S-Up>", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "跳转到上一错误/警告" })
vim.keymap.set("n", "<S-Down>", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "跳转到下一错误/警告" })
--切换窗口(类似tmux)
vim.keymap.set("n", "<C-Right>", nvim_tmux.NvimTmuxNavigateRight, { desc = "移动到右边窗口" })
vim.keymap.set("n", "<C-Left>", nvim_tmux.NvimTmuxNavigateLeft, { desc = "移动到左边窗口" })
vim.keymap.set("n", "<C-Up>", nvim_tmux.NvimTmuxNavigateUp, { desc = "移动到上边窗口" })
vim.keymap.set("n", "<C-Down>", nvim_tmux.NvimTmuxNavigateDown, { desc = "移动到下边窗口" })
--打开搜索框
vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "打开搜索框" })
--打开关键词搜索框
vim.keymap.set("n", "<leader>fk", ":GrugFar<CR>", { desc = "打开关键词搜索" })
--lsp快捷键
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "跳转到定义" })
vim.keymap.set("n", "gh", vim.lsp.buf.hover, { desc = "跳转到" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "跳转到" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "跳转到" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "跳转到" })
--打开旧文件
vim.keymap.set("n", "<leader>rf", fzf.oldfiles, { desc = "打开历史文件" })
--打开一个终端
vim.keymap.set("n", "<leader>te", ":terminal<CR>i", { desc = "打开终端" })
--关缓冲区
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "关掉标签页" })
--全选
vim.keymap.set("n", "<C-a>", "maggVG", { desc = "全选" })
vim.keymap.set("v", "<C-a>", "<ESC>'a", { desc = "取消全选" })
vim.keymap.set("v", "y", "y<ESC>'a", { desc = "全选复制" })
--lazygit
vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", { desc = "打开lazygit" })
--运行代码(normal)
vim.keymap.set("n", "<F5>", run_code.run_code("normal"), { desc = "运行代码" })
--运行代码(extra)
vim.keymap.set("n", "<F9>", run_code.run_code("extra"), { desc = "用第二种命令运行代码" })
--终端模式切换回普通模式
vim.keymap.set("t", "<C-f>", "<C-\\><C-N>", { desc = "终端模式切普通模式" })
--关闭当前通知
vim.keymap.set("n", "<leader>qq", ":Noice dismiss<CR>", { desc = "关闭所有通知" })
--打开颜色选择
vim.keymap.set("n", "<leader>cc", ":Colortils<CR>", { desc = "tui选择颜色" })
--打开配置文件
vim.keymap.set("n", "<leader>cf", open_config.open_config(), { desc = "打开配置文件" })
--切换主题
vim.keymap.set("n", "<leader>th", choose_theme.choose_theme, { desc = "选择主题" })
--刷新nvim界面
vim.keymap.set("n", "<leader>dw", ":redraw<CR>", { desc = "刷新nvim界面" })
--编辑snip
vim.keymap.set("n", "<leader>se", function()
	require("scissors").editSnippet()
end, { desc = "编辑补全标签" })
--新增snip
vim.keymap.set({ "n", "x" }, "<leader>sa", function()
	require("scissors").addNewSnippet()
end, { desc = "添加补全标签" })
--切换nvim-tree和工作文件夹到当前文件所在的文件夹下面
vim.keymap.set("n", "<leader>cd", function()
	require("nvim-tree.api").tree.change_root(vim.fn.expand("%:p:h"))
	vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
end, { desc = "切换工作目录到此处" })
--切换窗口
vim.keymap.set("n", "<leader>w", "<C-w>w", { desc = "切换窗口" })
--重启lsp
vim.keymap.set("n", "<leader>lr", ":lsp restart<CR>", { desc = "重载lsp" })
-- 快速跳转词汇
vim.keymap.set("n", "<leader>h", ":HopWord<CR>", { desc = "快速跳转词汇" })

local vim = vim
vim.g.mapleader = " "
local fzf = require("fzf-lua")
local nvim_tmux = require("nvim-tmux-navigation")
local run_code = require("plugin.run_code")
local open_config = require("plugin.open_config")
local choose_theme = require("plugin.theme")
-- 窗口
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "open new window -" }) -- 水平新增窗口
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "open new window |" }) -- 垂直新增窗口
-- 取消高亮
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "cancel highlight" })
--保存并格式化
vim.keymap.set("n", "<C-s>", ":w!<CR>", { desc = "save file and format" })
--打开mason
vim.keymap.set("n", "<leader>ms", ":Mason<CR>", { desc = "open lsp manager" })
--打开lazy.nvim
vim.keymap.set("n", "<leader>ly", ":Lazy<CR>", { desc = "open plugin manager" })
--打开nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "open file tree" })
--切换butterline
vim.keymap.set("n", "<S-L>", ":bnext<CR>", { desc = "goto next tab" })
vim.keymap.set("n", "<S-H>", ":bprevious<CR>", { desc = "goto previous tab" })
vim.keymap.set("n", "<S-Right>", ":bnext<CR>", { desc = "goto next tab" })
vim.keymap.set("n", "<S-Left>", ":bprevious<CR>", { desc = "goto previous tab" })
--跳转错误
vim.keymap.set("n", "<S-K>", vim.diagnostic.goto_prev, { desc = "goto previous error" })
vim.keymap.set("n", "<S-J>", vim.diagnostic.goto_next, { desc = "goto next error" })
vim.keymap.set("n", "<S-Up>", vim.diagnostic.goto_prev, { desc = "goto previous error" })
vim.keymap.set("n", "<S-Down>", vim.diagnostic.goto_next, { desc = "goto next error" })
--切换窗口(类似tmux)
vim.keymap.set("n", "<C-Right>", nvim_tmux.NvimTmuxNavigateRight)
vim.keymap.set("n", "<C-Left>", nvim_tmux.NvimTmuxNavigateLeft)
vim.keymap.set("n", "<C-Up>", nvim_tmux.NvimTmuxNavigateUp)
vim.keymap.set("n", "<C-Down>", nvim_tmux.NvimTmuxNavigateDown)
--打开搜索框
vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "open file search" })
--lsp快捷键
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "goto definition" })
vim.keymap.set("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "goto hover" })
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "goto declaration" })
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "goto implementation" })
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "goto references" })
--预览markdown
vim.keymap.set("n", "<leader>md", ":RenderMarkdown toggle<CR>", { desc = "enable md preview" })
--打开旧文件
vim.keymap.set("n", "<leader>rf", fzf.oldfiles, { desc = "search history file" })
--打开一个终端
vim.keymap.set("n", "<leader>te", ":terminal<CR>i", { desc = "open terminal" })
--关缓冲区
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "close tab" })
--全选
vim.keymap.set("n", "<C-a>", "maggVG", { desc = "select all" })
vim.keymap.set("v", "<C-a>", "<ESC>'a", { desc = "cancel select all" })
--lazygit
vim.keymap.set("n", "<leader>lg", ":terminal<CR>ilazygit<CR>", { desc = "open lazygit" })
--运行代码(normal)
vim.keymap.set("n", "<F5>", run_code.run_code("normal"), { desc = "run code normal" })
--运行代码(extra)
vim.keymap.set("n", "<F9>", run_code.run_code("extra"), { desc = "run code extra" })
--终端模式切换回普通模式
vim.keymap.set("t", "<C-f>", "<C-\\><C-N>", { desc = "terminal to normal" })
--关闭当前通知
vim.keymap.set("n", "<leader>qq", ":Noice dismiss<CR>", { desc = "close all noice" })
--打开颜色选择
vim.keymap.set("n", "<leader>cc", ":Colortils<CR>", { desc = "choose color" })
--打开配置文件
vim.keymap.set("n", "<leader>cf", open_config.open_config(), { desc = "open config folder" })
--切换主题
vim.keymap.set("n", "<leader>th", choose_theme.choose_theme, { desc = "choose theme" })
--刷新nvim界面
vim.keymap.set("n", "<leader>dw", ":redraw<CR>", { desc = "refresh nvim" })

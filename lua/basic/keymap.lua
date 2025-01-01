local vim = vim
vim.g.mapleader = " "
local fzf = require("fzf-lua")
local nvim_tmux = require("nvim-tmux-navigation")
local run_code = require("plugin.run_code")
local open_config = require("plugin.open_config")
-- 窗口
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口
-- 取消高亮
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")
--保存并格式化
vim.keymap.set("n", "<C-s>", ":w!<CR>")
--打开mason
vim.keymap.set("n", "<leader>ms", ":Mason<CR>")
--打开lazy.nvim
vim.keymap.set("n", "<leader>ly", ":Lazy<CR>")
--打开nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
--切换butterline
vim.keymap.set("n", "<S-L>", ":bnext<CR>")
vim.keymap.set("n", "<S-H>", ":bprevious<CR>")
vim.keymap.set("n", "<S-Right>", ":bnext<CR>")
vim.keymap.set("n", "<S-Left>", ":bprevious<CR>")
--跳转错误
vim.keymap.set("n", "<S-K>", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<S-J>", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<S-Up>", vim.diagnostic.goto_next)
vim.keymap.set("n", "<S-Down>", vim.diagnostic.goto_next)
--切换窗口(类似tmux)
vim.keymap.set("n", "<C-Right>", nvim_tmux.NvimTmuxNavigateRight)
vim.keymap.set("n", "<C-Left>", nvim_tmux.NvimTmuxNavigateLeft)
vim.keymap.set("n", "<C-Up>", nvim_tmux.NvimTmuxNavigateUp)
vim.keymap.set("n", "<C-Down>", nvim_tmux.NvimTmuxNavigateDown)
--打开搜索框
vim.keymap.set("n", "<leader>ff", fzf.files)
--lsp快捷键
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
--预览markdown
vim.keymap.set("n", "<leader>md", ":RenderMarkdown toggle<CR>")
--打开旧文件
vim.keymap.set("n", "<leader>rf", fzf.oldfiles)
--打开一个终端
vim.keymap.set("n", "<leader>te", ":terminal<CR>i")
--关缓冲区
vim.keymap.set("n", "<leader>bd", ":bd<CR>")
--全选
vim.keymap.set("n", "<C-a>", "ggVG")
--lazygit
vim.keymap.set("n", "<leader>lg", ":terminal<CR>ilazygit<CR>")
--运行代码(normal)
vim.keymap.set("n", "<F5>", run_code.run_code("normal"))
--运行代码(extra)
vim.keymap.set("n", "<F9>", run_code.run_code("extra"))
--终端模式切换回普通模式
vim.keymap.set("t", "<C-f>", "<C-\\><C-N>")
--关闭当前通知
vim.keymap.set("n", "<leader>qq", ":Noice dismiss<CR>")
--打开颜色选择
vim.keymap.set("n", "<leader>cc", ":Colortils<CR>")
--打开配置文件
vim.keymap.set("n", "<leader>cf", open_config.open_config(), { desc = "open config folder" })

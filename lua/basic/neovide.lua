local vim = vim
if vim.g.neovide then
	--字体
	vim.o.guifont = "Maple Mono NL NF CN:h16"
	-- vim.o.guifont = "CodeNewRoman Nerd Font Mono:h16"
	-- vim.o.guifont = "ComicShannsMono Nerd Font:h16"
	--背景透明度
	vim.g.neovide_normal_opacity = 0.95
	vim.g.neovide_opacity = 0.95
	--浮动窗口模糊程度
	vim.g.neovide_floating_blur_amount_x = 0.9
	vim.g.neovide_floating_blur_amount_y = 0.9
	--位置动画长度
	vim.g.neovide_position_animation_length = 0.3
	--滚动动画长度
	vim.g.neovide_scroll_animation_length = 0.25
	--刷新率
	vim.g.neovide_refresh_rate = 90
	--禁止空闲(我都拿你写代码了你还想闲着?😡)
	vim.g.neovide_no_idle = true
	--抗锯齿
	vim.g.neovide_cursor_antialiasing = false
	--未保存时,退出需要确认
	vim.g.neovide_confirm_quit = true
	--记住窗口大小
	vim.g.neovide_remember_window_size = true
	--动画延迟
	vim.g.neovide_cursor_animation_length = 0.15
	--动画轨迹大小
	vim.g.neovide_cursor_trail_size = 0.3
	--粒子动画类型
	vim.g.neovide_cursor_vfx_mode = "pixiedust"
	--粒子不透明度
	vim.g.neovide_cursor_vfx_opacity = 100
	--粒子密度
	vim.g.neovide_cursor_vfx_particle_density = 5.0
	--粒子速度
	vim.g.neovide_cursor_vfx_particle_speed = 2.0
	--粒子生命周期
	vim.g.neovide_cursor_vfx_particle_lifetime = 0.8
	vim.g.neovide_cursor_vfx_particle_highlight_lifetime = 0.5
	--neovide主题
	vim.g.neovide_theme = "dark"
	--改变字体大小
	vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
	vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
	--全屏
	vim.keymap.set("n", "<F11>", ":lua vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen<CR>")
end

local vim = vim
if vim.g.neovide then
	--字体
	vim.o.guifont = "ComicShannsMono Nerd Font Mono:h16"
	--背景透明度
	vim.g.neovide_normal_opacity = 0.9
	vim.g.neovide_opacity = 0.95
	--位置动画长度
	vim.g.neovide_position_animation_length = 0.2
	--滚动动画长度
	vim.g.neovide_scroll_animation_length = 0.3
	--刷新率
	vim.g.neovide_refresh_rate = 70
	--禁止空闲(我都拿你写代码了你还想闲着?😡)
	vim.g.neovide_no_idle = true
	--抗锯齿
	vim.g.neovide_cursor_antialiasing = true
	--未保存时,退出需要确认
	vim.g.neovide_confirm_quit = true
	--记住窗口大小
	vim.g.neovide_remember_window_size = true
	--动画延迟
	vim.g.neovide_cursor_animation_length = 0.15
	--动画轨迹大小
	vim.g.neovide_cursor_trail_size = 0.5
	--粒子动画类型
	vim.g.neovide_cursor_vfx_mode = "pixiedust"
	--粒子不透明度
	vim.g.neovide_cursor_vfx_opacity = 100
	--粒子密度
	vim.g.neovide_cursor_vfx_particle_density = 2.0
	--粒子速度
	vim.g.neovide_cursor_vfx_particle_speed = 5.0
	--粒子生命周期
	vim.g.neovide_cursor_vfx_particle_lifetime = 0.7
	vim.g.neovide_cursor_vfx_particle_highlight_lifetime = 0.4
	--neovide主题
	vim.g.neovide_theme = "dark"
	--改变字体大小
	vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
	vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
	--全屏
	vim.keymap.set("n", "<F11>", ":lua vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen<CR>")
end

if vim.g.neovide then
	vim.o.guifont = "Hack Nerd Font Mono:h14"
	vim.g.neovide_transparency = 0.95
	vim.g.neovide_refresh_rate = 75
	vim.g.neovide_no_idle = true
	-- vim.g.neovide_refresh_rate_idle = 15
	vim.g.neovide_cursor_antialiasing = true
	vim.g.neovide_confirm_quit = true
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_cursor_vfx_mode = "pixiedust"
	vim.g.neovide_cursor_vfx_particle_density = 6.0
	vim.g.neovide_cursor_vfx_particle_lifetime = 2
	vim.g.neovide_theme = "dark"
	vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
	vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
end

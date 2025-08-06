function TheMe(color)
	color = color or 'rose-pine'
	vim.cmd.colorscheme(color)
end

TheMe('monokai_pro')
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = 'darkcyan', bg = "darkcyan" })

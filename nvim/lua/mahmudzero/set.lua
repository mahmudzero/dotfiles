-- needed for lsp
-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

vim.opt.ruler = true
vim.opt.number = true
vim.opt.laststatus = 2

vim.opt.tabstop = 6
vim.opt.softtabstop = 6
vim.opt.shiftwidth = 6

vim.opt.expandtab = false
-- vim.opt.smartindent = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = 'split'

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.colorcolumn = '121'

vim.opt.backspace = 'indent,eol,start'

vim.opt.mouse = ''

local handle = io.popen('pwd')
local current_dir = handle:read('*a')
handle:close()

vim.api.nvim_set_keymap('i', '<S-Tab>', 'copilot#Accept("<CR>")', { expr = true, silent = true })

vim.b.copilot_enabled = 0
vim.b.copilot_disabled = 1
if string.match(current_dir, "/Users/mahmudahmad/work") or string.match(current_dir, "/Users/mahmudahmad/Development/work") then
	vim.b.copilot_enabled = 1
	vim.b.copilot_disabled = 0
end

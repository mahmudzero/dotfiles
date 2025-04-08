local handle = io.popen('pwd')
local current_dir = handle:read('*a')
handle:close()

vim.g.copilot_enabled = false
if string.match(current_dir, "/Users/mahmudahmad/work") or string.match(current_dir, "/Users/mahmudahmad/Development/work") then
	vim.g.copilot_enabled = true
end

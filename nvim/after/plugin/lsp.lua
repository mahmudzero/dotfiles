local lsp = require('lsp-zero')

-- this needs mason.nvim
-- lsp.ensure_installed({
--   'gopls',
-- })

-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers,
-- this list has all the language servers we need, and how to install them

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = cmp.mapping.preset.insert({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	-- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<Tab>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

-- cmp_mappings['<Tab>'] = vim.NIL
cmp_mappings['<S-Tab>'] = vim.NIL

cmp.setup({
	mapping = cmp_mappings,
	sources = {
		{ name = "buffer" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },

	},
})

-- figure this out, idk how to do it
-- lsp.set_preferences({
--     suggest_lsp_servers = false,
-- })
lsp.set_sign_icons({
	error = 'E',
	warn = 'W',
	hint = 'H',
	info = 'I'
})

vim.diagnostic.config({
	virtual_text = false, -- turn off in-line errors
})

vim.api.nvim_set_keymap(
	'n', '<leader>d', ':lua vim.diagnostic.open_float()<CR>',
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	'n', '<leader>dn', ':lua vim.diagnostic.goto_next()<CR>',
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	'n', '<leader>dp', ':lua vim.diagnostic.goto_prev()<CR>',
	{ noremap = true, silent = true }
)

vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = { buffer = event.bufnr, remap = false }

		vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
		vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
		vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
		vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
		vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
		vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
		vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
		vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
		vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
	end,
})

lsp.format_on_save({
	format_ops = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		['lua_ls'] = { 'lua' },
		['gopls'] = { 'go' },
	}
})

lsp.setup()

require('lspconfig').lua_ls.setup {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
}

require('lspconfig').gopls.setup {}

require('lspconfig').ts_ls.setup {
	filetypes = {
		"javascript",
		"typescript",
		"jsx",
	}
}

vim.diagnostic.config({
	virtual_text = true
})

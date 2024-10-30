local lsp = require('lsp-zero')

-- this needs mason.nvim
-- lsp.ensure_installed({
--   'gopls',
-- })

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
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

  }
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

vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = {buffer = event.bufnr, remap = false}

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

lsp.setup()

require('lspconfig').lua_ls.setup{
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

require('lspconfig').gopls.setup{}

vim.diagnostic.config({
    virtual_text = true
})

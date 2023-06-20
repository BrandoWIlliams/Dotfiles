local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}
lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.svelte.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.volar.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
-- setup diagnostics
-- vim.diagnostic.config { virtual_text = false }
-- vim.api.nvim_create_autocmd({ "CursorHold" }, {
--   callback = function()
--     if vim.lsp.buf.server_ready() then
--       vim.diagnostic.open_float()
--     end
--   end,
-- })

-- set up LSP signs
for type, icon in pairs {
  Error = "",
  Warn = "",
  Hint = "",
  Info = "",
} do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

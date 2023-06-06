local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- webdev stuff
  --b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier,
  --lint
  b.code_actions.eslint,
  -- Lua
  b.formatting.stylua,
  -- cpp
  b.formatting.clang_format,
}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup {
   -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.format({ async = false })
                    vim.lsp.buf.formatting_sync()
                end,
            })
        end
    end,
  debug = true,
  sources = sources,
}
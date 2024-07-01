--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- require'lspconfig'.cssmodules_ls.setup{
  -- -- capabilities = capabilities,
-- }

-- require'lspconfig'.bashls.setup{
  -- -- capabilities = capabilities,
-- }

-- require'lspconfig'.ansiblels.setup{
  -- filetypes = {"yml"}
-- }

-- require'lspconfig'.cssls.setup {
  -- capabilities = capabilities,
-- }

-- require'lspconfig'.html.setup{
  -- capabilities = capabilities,
-- }

-- require'lspconfig'.jsonls.setup {
  -- -- capabilities = capabilities,
-- }

require'lspconfig'.eslint.setup{
  capabilities = capabilities,
}

-- vim.lsp.set_log_level("debug")
-- autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll


-- local lsp_group = vim.api.nvim_create_augroup("lsp_group", { clear = true })

-- vim.api.nvim_create_autocmd("BufWritePre", {
  -- callback = function()
    -- vim.lsp.buf.formatting()
  -- end,
  -- group = lsp_group,
-- })


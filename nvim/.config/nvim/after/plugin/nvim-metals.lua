local Remap = require("janekkar.keymap")
local nnoremap = Remap.nnoremap

--=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
-- These are example settings to use with nvim-metals and the nvim built in
-- LSP.  Be sure to thoroughly read the the help docs to get an idea of what
-- everything does.
--
-- The below configuration also makes use of the following plugins besides
-- nvim-metals
-- - https://github.com/nvim-lua/completion-nvim
--=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+

-------------------------------------------------------------------------------
-- nvim-lsp Mappings
-------------------------------------------------------------------------------
nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
nnoremap("K", ":lua vim.lsp.buf.hover()<CR>")
nnoremap("gi", ":lua vim.lsp.buf.implementation()<CR>")
nnoremap("gr", ":lua vim.lsp.buf.references()<CR>")
nnoremap("gds", ":lua vim.lsp.buf.document_symbol()<CR>")
nnoremap("gws", ":lua vim.lsp.buf.workspace_symbol()<CR>")
nnoremap("<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
nnoremap("<leader>f", ":lua vim.lsp.buf.formatting()<CR>")
nnoremap("<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
nnoremap("<leader>ws", ":lua require'metals'.worksheet_hover()<CR>")
nnoremap("<leader>a", ":lua require'metals'.open_all_diagnostics()<CR>")
nnoremap("<space>d", ":lua vim.lsp.diagnostic.set_loclist()<CR>")
nnoremap("[c", ":lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>")
nnoremap("]c", ":lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>")

-------------------------------------------------------------------------------
-- nvim-lsp Settings
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- nvim-metals setup with a few additions such as nvim-completions
-------------------------------------------------------------------------------
metals_config = require'metals'.bare_config()
metals_config.settings = {
  showImplicitArguments = true,
    excludedPackages = {
     "akka.actor.typed.javadsl",
     "com.github.swagger.akka.javadsl"
   }
}

metals_config.on_attach = function()
  require'cmp'.on_attach();
end

metals_config.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = '',
    }
  }
)

-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.formatting()
  end,
  group = nvim_metals_group,
})

vim.api.nvim_create_autocmd("FileType", {
  -- NOTE: You may or may not want java included here. You will need it if you
  -- want basic Java support but it may also conflict if you are using
  -- something like nvim-jdtls which also works on a java filetype autocmd.
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})

-------------------------------------------------------------------------------
-- Helpful general settings
-------------------------------------------------------------------------------

-- Set completeopt to have a better completion experience
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt_global.shortmess:remove("F"):append("c")


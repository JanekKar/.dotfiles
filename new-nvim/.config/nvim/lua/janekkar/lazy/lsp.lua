return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- "williamboman/mason.nvim",
        -- "williamboman/mason-lspconfig.nvim",

        -- "L3MON4D3/LuaSnip",
        -- "saadparwaiz1/cmp_luasnip",
        -- "j-hui/fidget.nvim",

       'hrsh7th/cmp-vsnip',
       'hrsh7th/vim-vsnip',
       'hrsh7th/nvim-cmp',
       'hrsh7th/cmp-path',
       'hrsh7th/cmp-buffer',
       'hrsh7th/cmp-nvim-lua',
       'hrsh7th/cmp-nvim-lsp',
       "hrsh7th/cmp-cmdline",
       'onsails/lspkind.nvim'
    },

    config = function()
        local cmp = require('cmp')
        local lspkind = require("lspkind")
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        -- require("fidget").setup({})
        -- require("mason").setup()
        -- require("mason-lspconfig").setup({
            -- ensure_installed = {
                -- "lua_ls",
                -- "rust_analyzer",
                -- "gopls",
            -- },
            -- handlers = {
                -- function(server_name) -- default handler (optional)
                    -- require("lspconfig")[server_name].setup {
                        -- capabilities = capabilities
                    -- }
                -- end,

                -- zls = function()
                    -- local lspconfig = require("lspconfig")
                    -- lspconfig.zls.setup({
                        -- root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
                        -- settings = {
                            -- zls = {
                                -- enable_inlay_hints = true,
                                -- enable_snippets = true,
                                -- warn_style = true,
                            -- },
                        -- },
                    -- })
                    -- vim.g.zig_fmt_parse_errors = 0
                    -- vim.g.zig_fmt_autosave = 0

                -- end,
                -- ["lua_ls"] = function()
                    -- local lspconfig = require("lspconfig")
                    -- lspconfig.lua_ls.setup {
                        -- capabilities = capabilities,
                        -- settings = {
                            -- Lua = {
                                -- runtime = { version = "Lua 5.1" },
                                -- diagnostics = {
                                    -- globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                -- }
                            -- }
                        -- }
                    -- }
                -- end,
            -- }
        -- })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
              -- None of this made sense to me when first looking into this since there
              -- is no vim docs, but you can't have select = true here _unless_ you are
              -- also using the snippet stuff. So keep in mind that if you remove
              -- snippets you need to remove this select
              ["<CR>"] = cmp.mapping.confirm({ select = true }),
              ["<Tab>"] = cmp.mapping.confirm({ select = true }),
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
            }),
            sources = {
              { name = "nvim_lsp" },
              { name = "nvim_lua" },
              { name = "path" },
              { name = "vsnip" },
              { name = "buffer", keyword_length  = 3}
            },
            snippet = {
              expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
                -- require("vsnip").lsp_expand(args.body)
              end,
            },
            formatting = {
              format = lspkind.cmp_format {
                with_text = true,
                menu = {
                  buffer = "[buf]",
                  nvim_lsp = "[LSP]",
                  nvim_lua = "[api]",
                  path = "[path]",
                  vsnip = "[snip]",
                  gh_issues = "[issues]",
                },
              },
            },

            experimental = {
              native_menu = false,
              ghost_text = true
            }
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}



 -- Some old stuff TODO
-- --Enable (broadcasting) snippet capability for completion
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- -- require'lspconfig'.cssmodules_ls.setup{
  -- -- -- capabilities = capabilities,
-- -- }

-- -- require'lspconfig'.bashls.setup{
  -- -- -- capabilities = capabilities,
-- -- }

-- -- require'lspconfig'.ansiblels.setup{
  -- -- filetypes = {"yml"}
-- -- }

-- -- require'lspconfig'.cssls.setup {
  -- -- capabilities = capabilities,
-- -- }

-- -- require'lspconfig'.html.setup{
  -- -- capabilities = capabilities,
-- -- }

-- -- require'lspconfig'.jsonls.setup {
  -- -- -- capabilities = capabilities,
-- -- }

-- require'lspconfig'.eslint.setup{
  -- capabilities = capabilities,
-- }

-- -- vim.lsp.set_log_level("debug")
-- -- autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll


-- -- local lsp_group = vim.api.nvim_create_augroup("lsp_group", { clear = true })

-- -- vim.api.nvim_create_autocmd("BufWritePre", {
  -- -- callback = function()
    -- -- vim.lsp.buf.formatting()
  -- -- end,
  -- -- group = lsp_group,
-- -- })


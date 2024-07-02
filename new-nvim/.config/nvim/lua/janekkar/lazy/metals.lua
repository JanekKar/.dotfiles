return{
 'scalameta/nvim-metals',
  config = function()
    local map = vim.keymap.set
    vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

    map("n", "gd", vim.lsp.buf.definition, {})
    map("n", "K", vim.lsp.buf.hover, {})
    map("n", "gi",vim.lsp.buf.implementation, {})
    map("n", "gr",vim.lsp.buf.references, {})
    map("n", "gds", vim.lsp.buf.document_symbol, {})
    map("n", "gws", vim.lsp.buf.workspace_symbol, {})
    map("n", "<leader>rn", vim.lsp.buf.rename, {})
    map("n", "<leader>f", vim.lsp.buf.format, {})
    map("n", "<leader>ca", vim.lsp.buf.code_action, {})
    map("n", "<leader>nd", vim.diagnostic.goto_next, {})
    map("n", "<leader>pd", vim.diagnostic.goto_prev, {})

    map("n", "<leader>aa", vim.diagnostic.setqflist, {})
    map("n", "<leader>ae", function()
      vim.diagnostic.setqflist({ severity = "E" })
    end)
    map("n", "<leader>d", vim.diagnostic.setloclist, {})

    metals_config = require('metals').bare_config()
    metals_config.settings = {
      showImplicitArguments = true,
        excludedPackages = {
         "akka.actor.typed.javadsl",
         "com.github.swagger.akka.javadsl"
       }
    }

    -- Setting cmp
    metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- metals_config.on_attach = function()
      -- require'cmp'.on_attach();
    -- end

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
        vim.lsp.buf.format()
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
    -- vim.opt_global.shortmess:remove("F"):append("c")

  end
}

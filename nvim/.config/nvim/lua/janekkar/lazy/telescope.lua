return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim"
    },

    config = function()
        require('telescope').setup{
        defaults = {
          file_ignore_patterns = {
                "target",
                "__init__.py",
                ".git/",
                ".bloop/",
                ".metals/",
                "metals.sbt",
                ".bsp/",
                ".g8/"
            }
          },
          pickers = {
            find_files = {
              hidden = true,
              no_ignore = true
            }
          }
        }

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set("n", "<leader>fh", builtin.help_tags,{})

        vim.keymap.set("n", "<leader>mc", require('telescope').extensions.metals.commands, {})
    end
}

require'nvim-treesitter.configs'.setup {

  ensure_installed = {
    "java",
    "scala",
    "html",
    "javascript",
    "python",
    "dockerfile",
    "json",
    "latex",
    "lua",
    "regex",
    "bash"
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  incremental_selection = {
    enable = true
  },

  textobjects = {
    enable = true
  },

  indent = {
    enable = true
  }
}

require('telescope').setup{
defaults ={
  file_ignore_patterns = {
        "target",
        "__init__.py",
        ".git/*",
        ".bloop./*",
        ".metals./*",
        ".bsp/*"
    }
  },
pickers = {
    find_files = {
      hidden = true
    }
  }
}

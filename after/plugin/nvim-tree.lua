require('nvim-tree').setup{
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  },
  filters = {
    git_ignored = false,
    dotfiles = false,
    custom = {
      "node_modules",
      ".cache",
      "^\\.git$",
      "target",
      "build",
      "dist",
    }
  },
}

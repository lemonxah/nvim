return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    local neotree = require "neo-tree"
    -- neo tree toggle
    neotree.setup {
      filesystem = {
        -- list of directories to ignore
        ignore = { ".git", "node_modules", ".cache" },
        -- list of files to ignore
        hidden = { ".gitignore", ".gitmodules", ".DS_Store" },
        -- show hidden files
        show_hidden = false,
        -- width of the window
        width = 30,
        hijack_netrw_behavior = "open_default",
      },
    }
  end,
}

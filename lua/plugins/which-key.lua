return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    local wk = require "which-key"
    wk.register {
      ["<leader>"] = {
        c = {
          name = "+Code",
        },
        f = {
          name = "+Find",
        },
        g = {
          name = "+Git",
        },
        m = {
          name = "+Mason",
        },
        q = {
          name = "+Close",
        },
      },
    }
  end,
}

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
    -- scroll = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      }
    }
  },
  keys = {
    { "<leader>e", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit" }
  },
  config = function(_, opts)
    require("snacks").setup(opts) 
    -- Configure diagnostic display
    vim.diagnostic.config({
      virtual_text = {
        spacing = 4,
        prefix = '●',
        source = "if_many",
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
    
    vim.keymap.set('n', 'le', vim.diagnostic.open_float, { desc = "Show line diagnostics" })
  end,
}

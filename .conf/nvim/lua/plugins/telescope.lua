return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
         defaults = {
           vimgrep_arguments = {
             "rg",
             "--color=never",
             "--no-heading",
             "--with-filename",
             "--line-number",
             "--column",
             "--smart-case",
             "--fixed-strings",
           },
         },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>fr', builtin.resume, {})

      vim.keymap.set('n', '<leader>fc', '<cmd>Telescope live_grep search_dirs={"%:p"} vimgrep_arguments=rg,--color=never,--no-heading,--with-filename,--line-number,--column,--smart-case,--fixed-strings<cr>')
      vim.keymap.set('n', '<leader>fd', builtin.git_files, {})

      require("telescope").load_extension("ui-select")
    end,
  },
}

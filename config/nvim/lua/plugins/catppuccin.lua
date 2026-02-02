return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    -- 1. This compiles the theme to cached Lua code for faster startup/loading
    build = ":CatppuccinCompile", 
    config = function()
      require("catppuccin").setup({
        -- 2. Performance: Pre-compile
        compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
        
        -- 3. Disable transparency to stop WezTerm from calculating blending
        transparent_background = false,
        
        -- 4. Optimizations
        show_end_of_buffer = false, -- simpler drawing
        term_colors = true,
        
        -- 5. Control Integrations (Disable what you don't use!)
        integrations = {
          cmp = true,
          gitsigns = true,
          treesitter = true,
          mason = true,
          -- Native LSP is heavy with Rust. 
          -- If still laggy, set enabled = false to test.
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
        },
      })
      
      vim.cmd.colorscheme "catppuccin-mocha"
    end
  }
}

return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "rust_analyzer", "html", "ts_ls", "pyright" },
                automatic_installation = true,
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- New Neovim 0.11+ API
            vim.lsp.config('lua_ls', {
                capabilities = capabilities,
            })
            vim.lsp.config('html', {
                capabilities = capabilities,
            })
            vim.lsp.config('clangd', {
                capabilities = capabilities,
            })
            vim.lsp.config('rust_analyzer', {
                capabilities = capabilities,
            })
            vim.lsp.config('ts_ls', {
                capabilities = capabilities,
            })
            vim.lsp.config('pyright', {
                capabilities = capabilities,
            })

            -- Enable all configured servers
            vim.lsp.enable({ 'lua_ls', 'html', 'clangd', 'rust_analyzer', 'ts_ls', 'pyright'})

            -- Keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}

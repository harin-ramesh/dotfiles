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
                ensure_installed = {"lua_ls", "clangd", "pylsp", "rust_analyzer"},
                automatic_installation = true,
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.html.setup({
                capabilities = capabilities
            })

            lspconfig.clangd.setup({
                capabilities = capabilities
            })

            lspconfig.rust_analyzer.setup({
                capabilities = capabilities
            })

            lspconfig.pylsp.setup({
                capabilities = capabilities,
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                ignore = {'W391', 'E201', 'E202', 'E203', 'E211', 'E225', 'E226', 'E227', 'E231', 'E252', 'E261', 'E262', 'E265', 'E266', 'E301', 'E302', 'E303', 'E305', 'E306', 'E401', 'E402', 'E501', 'E704'},
                            }
                        }
                    }
                }
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}

vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.keymap.set('n', '<c-k>', ':wincmd k<cr>')
vim.keymap.set('n', '<c-j>', ':wincmd j<cr>')
vim.keymap.set('n', '<c-h>', ':wincmd h<cr>')
vim.keymap.set('n', '<c-l>', ':wincmd l<cr>')

vim.keymap.set("n", "<leader>=", ":vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>-", ":split<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>h", ":vertical resize -5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>l", ":vertical resize +5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>k", ":resize +5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>j", ":resize -5<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'd', '"_d', { noremap = true })
vim.api.nvim_set_keymap('v', 'd', '"_d', { noremap = true })

vim.api.nvim_set_keymap('v', 'p', '"_dP', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'P', '"_dP', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'p', 'gp', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'P', 'gP', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>n', ':nohlsearch<cr>')

vim.keymap.set("n", "<leader>pv", function() vim.cmd("Ex") end)

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>q", ":qa!<cr>")

vim.keymap.set({ "n", "v" }, "<leader>o", "o<esc>k")
vim.keymap.set({ "n", "v" }, "<leader>O", "O<esc>j")

vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

vim.keymap.set({ "n", "v" }, "<leader>d", "yyp")

vim.keymap.set({ "n", "x" }, "{", "}")
vim.keymap.set({ "n", "x" }, "}", "{")

vim.keymap.set("n", "<leader>s", [[:%s/\<<c-r><c-w>\>/<c-r><c-w>/gi<left><left><left>]])

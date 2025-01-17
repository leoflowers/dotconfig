vim.o.nocompatible = true
vim.o.tabstop = 4
vim.o.softtabstop = -1
vim.o.shiftwidth = 0
vim.o.cursorline = true
vim.o.number = true
--vim.o.termguicolors = true
vim.cmd('syntax on')

require'lspconfig'.pyright.setup{}

require("config.lazy")


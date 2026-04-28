vim.g.mapleader = " "

require("crp.lazy_init")
require("crp.remap")
require("crp.picker")
require("crp.x509").setup()

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- vim.opt.colorcolumn = "80"

vim.opt.hls = true

vim.opt.ignorecase = true

-- Relative line numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Whitespaces
vim.opt.listchars = {
    nbsp = "+",
    tab = "> ",
    trail = "-",
    space = "⋅"
}
vim.opt.list = true

-- Make
vim.opt.makeprg = "cmake"

-- Override copilot suggestion color
vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#ff0000" })

-- Disable swap files
vim.opt.swapfile = false
vim.opt.backup = false

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
})

-- Yank to system clipboard
vim.opt.clipboard = "unnamedplus"


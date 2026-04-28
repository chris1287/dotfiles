local builtin = require('telescope.builtin')
local cmp = require('cmp')
local picker = require('crp.picker')
local wk = require('which-key')

wk.add({
    {'<leader>fg', function() require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") } end, desc="Grep word under cursor everywhere"},
    {'<leader>ff', builtin.find_files, desc="Find Files"},
    {'<leader>fw', builtin.live_grep, desc="Grep word everywhere"},
    {'<leader>fb', builtin.buffers, desc="Find buffers"},
    {'<leader>fz', builtin.current_buffer_fuzzy_find, desc="Fuzzy Find in current buffer"},
    {'<leader>fr', builtin.registers, desc="Find registers"},
    {'<leader><leader>', builtin.resume, desc="Resume last telescope"},
    {'<leader>gb', function() package.loaded.gitsigns.blame_line{full=true} end, desc="Blame line"},
    {'<C-n>', '<cmd>Oil<cr>', desc="Open Oil"},
    {'K', '<cmd>lua vim.lsp.buf.hover()<cr>', desc="Show description"},
    {'<leader>kk', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, desc="Toggle inlay hints"},
    {'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', desc="Go to definition"},
    {'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', desc="Go to declaration"},
    {'gr', '<cmd>lua vim.lsp.buf.references()<cr>', desc="Go to references"},
    {'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', desc="Go to type definition"},
    {'<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', desc="Rename"},
    {'<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', desc="Code action"},
    {'<C-s>', '<cmd>w<cr>', desc="Save"},
    {'<C-Space>', cmp.mapping.complete(), desc="Complete"},
    {'<', '<gv', desc="Indent left", mode="v"},
    {'>', '>gv', desc="Indent right", mode="v"},
    {'<M-Up>', ":move '<-2<cr>gv=gv", desc="Move block up", mode="v"},
    {'<M-Down>', ":move '>+1<cr>gv=gv", desc="Move block down", mode="v"},
    {'<C-b>', picker.pick_and_build, desc="Pick and build"},
    {'<M-q>', '<cmd>qa<cr>', desc="Quit all"},
    {'<leader>dn', vim.diagnostic.goto_next, desc="Next diagnostic"},
    {'<leader>dp', vim.diagnostic.goto_prev, desc="Previous diagnostic"},
    {'<leader>dl', vim.diagnostic.setloclist, desc="Open diagnostic in quickfix"},
    {'<leader>df', vim.diagnostic.open_float, desc="Open diagnostic in floating window"},
    {'<leader>t', '<cmd>TodoTelescope<cr>', desc="Telescope TODO"},
    {'<leader>hh', '<cmd>ClangdSwitchSourceHeader<cr>', desc="Switch Source/Header"},
    {'<leader>yn', function() vim.fn.setreg('+', vim.fn.expand('%')) end, desc="Yank current file name to clipboard"},
})


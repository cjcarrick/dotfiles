local map = vim.keymap.set

-- Leader
vim.g.mapleader = ' '
map('n', '<SPACE>', '<Nop>')

map('v', '<leader>y', '"*y')
map('n', '<leader>y', '"*y')

map('n', '<C-N>', ':bnext <cr>')
map('n', '<C-P>', ':bprev <cr>')

-- keep visual mode after indent
map('v', '>', '>gv')
map('v', '<', '<gv')

map('n', '<Leader>w', ':set wrap! <cr>')
map('n', '<Leader>T', ':set termguicolors! <cr>')

map('n', '<leader>c', ':CccPick <cr>')

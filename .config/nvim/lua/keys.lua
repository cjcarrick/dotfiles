local map = vim.keymap.set

-- Leader
vim.g.mapleader = ' '
map('n', '<SPACE>', '<Nop>')

map('n', '<C-N>', ':bnext <cr>')
map('n', '<C-P>', ':bprev <cr>')

-- keep visual mode after indent
map('v', '>', '>gv')
map('v', '<', '<gv')

map('n', '<Leader>w', ':set wrap! <cr>')

map('n', '<leader>c', ':CccPick <cr>')

local map = vim.keymap.set

-- Leader
vim.g.mapleader = ' '
map('n', '<SPACE>', '<Nop>')

map('v', '<leader>y', '"*y')
map('n', '<leader>y', '"*y')

map('n', '<C-N>', ':bnext <cr>')
map('n', '<C-P>', ':bprev <cr>')

map('t', '<esc>', '<C-\\><C-n>')

-- keep visual mode after indent
map('v', '>', '>gv')
map('v', '<', '<gv')

map('n', '<Leader>w', ':set wrap! <cr>')

map('n', '<leader>c', ':CccPick <cr>')

vim.g.tmux_navigator_no_mappings = 1
map('n', '<M-h>', ':TmuxNavigateLeft <cr>')
map('n', '<M-j>', ':TmuxNavigateDown <cr>')
map('n', '<M-k>', ':TmuxNavigateUp <cr>')
map('n', '<M-l>', ':TmuxNavigateRight <cr>')

map('n', '<leader>t', ':set filetype=')
map('n', '<leader>s', 'z=')

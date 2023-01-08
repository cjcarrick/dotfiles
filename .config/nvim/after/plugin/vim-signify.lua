local map = vim.keymap.set

vim.g.netrw_browsex_viewer = 'open'

map('n', 'gd', ':SignifyDiff     <cr>')
map('n', 'gt', ':SignifyToggle   <cr>')
map('n', 'gf', ':SignifyFold     <cr>')

map('n', 'gr', ':SignifyRefresh  <cr>')

map('n', 'gd', ':SignifyHunkDiff <cr>')
map('n', 'gu', ':SignifyHunkUndo <cr>')

map('n', 'gn', '<plug>(signify-next-hunk)')
map('n', 'gp', '<plug>(signify-prev-hunk)')

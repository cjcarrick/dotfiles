local map = vim.keymap.set

vim.g.netrw_browsex_viewer = 'open'

vim.g.signify_sign_add = '│'
vim.g.signify_sign_delete = '│'
vim.g.signify_sign_delete_first_line = '│'
vim.g.signify_sign_change = '│'
vim.g.signify_sign_change_delete = vim.g.signify_sign_change .. vim.g.signify_sign_delete_first_line

if vim.g.signify_vcs_cmds == nil then
  vim.g.signify_vcs_cmds = { git = 'git diff --no-color --no-ext-diff -U0 -w -- %f' }
end

map('n', 'vd', ':SignifyDiff     <cr>')
map('n', 'vt', ':SignifyToggle   <cr>')
map('n', 'vF', ':SignifyFold     <cr>')

map('n', 'vr', ':SignifyRefresh  <cr>')

map('n', 'vd', ':SignifyHunkDiff <cr>')
map('n', 'vu', ':SignifyHunkUndo <cr>')

map('n', 'v]', '<plug>(signify-next-hunk)')
map('n', 'v[', '<plug>(signify-prev-hunk)')

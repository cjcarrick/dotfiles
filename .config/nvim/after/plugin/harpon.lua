if not pcall(require, 'harpoon') then return end

vim.keymap.set('n', '<leader><cr>', function() require('harpoon.mark').add_file() end)
vim.keymap.set('n', '<leader><tab>', function() require('harpoon.ui').toggle_quick_menu() end)

vim.keymap.set('n', '<leader>]', function() require('harpoon.ui').nav_next() end)
vim.keymap.set('n', '<leader>[', function() require('harpoon.ui').nav_prev() end)

vim.keymap.set('n', '<leader>1', function() require('harpoon.ui').nav_file(1) end)
vim.keymap.set('n', '<leader>2', function() require('harpoon.ui').nav_file(2) end)
vim.keymap.set('n', '<leader>3', function() require('harpoon.ui').nav_file(3) end)
vim.keymap.set('n', '<leader>4', function() require('harpoon.ui').nav_file(4) end)
vim.keymap.set('n', '<leader>5', function() require('harpoon.ui').nav_file(5) end)
vim.keymap.set('n', '<leader>6', function() require('harpoon.ui').nav_file(6) end)
vim.keymap.set('n', '<leader>7', function() require('harpoon.ui').nav_file(7) end)
vim.keymap.set('n', '<leader>8', function() require('harpoon.ui').nav_file(8) end)
vim.keymap.set('n', '<leader>9', function() require('harpoon.ui').nav_file(9) end)
vim.keymap.set('n', '<leader>0', function() require('harpoon.ui').nav_file(10) end)
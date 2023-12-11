local ok, telescope = pcall(require, 'telescope')
if not ok then return end

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<esc>'] = require('telescope.actions').close,
        ['<C-k>'] = require('telescope.actions').move_selection_previous,
        ['<C-j>'] = require('telescope.actions').move_selection_next,
      },
    },
  },

  pickers = {
    find_files = { theme = 'dropdown' },
    treesitter = { theme = 'dropdown' },
    oldfiles = { theme = 'dropdown' },
    filetypes = { theme = 'dropdown' },
    live_grep = { theme = 'dropdown' },
  },
}

vim.keymap.set('n', '<leader>p',  ':Telescope find_files <cr>')
vim.keymap.set('n', '<leader>hl', ':Telescope highlights <cr>')
vim.keymap.set('n', '<leader>r',  ':Telescope oldfiles <cr>')
vim.keymap.set('n', '<leader>l',  ':Telescope grep_string search="" <cr>')

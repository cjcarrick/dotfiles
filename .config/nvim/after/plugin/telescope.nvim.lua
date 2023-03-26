if not pcall(require, 'telescope') then return end

require('telescope').setup {
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
    filetypes = { theme = 'ivy' },
    live_grep = { theme = 'dropdown' },
  },
}

vim.keymap.set('n', '<leader>p',  ':Telescope find_files <cr>')
vim.keymap.set('n', '<leader>s',  ':Telescope spell_suggest <cr>')
vim.keymap.set('n', '<leader>hl', ':Telescope highlights <cr>')
vim.keymap.set('n', '<leader>r',  ':Telescope oldfiles <cr>')
vim.keymap.set('n', '<leader>t',  ':Telescope filetypes <cr>')
vim.keymap.set('n', '<leader>l',  ':Telescope grep_string search="" <cr>')

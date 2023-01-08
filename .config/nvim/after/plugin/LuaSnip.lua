local ls = require 'luasnip'

ls.config.set_config {
  history = true,
  updateEvents = 'TextChanged,TextChangedI',
  enable_autosnippets = true,
  -- treesitter-based snippets
  ft_func = require('luasnip.extras.filetype_functions').from_cursor_pos,
}

-- Bindings

vim.keymap.set({ 'i', 's' }, '<c-k>', function()
  if ls.jumpable(-1) then ls.jump(-1) end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<c-j>', function()
  if ls.expand_or_jumpable() then ls.expand_or_jump() end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<c-l>', function()
  if ls.choice_active() then ls.change_choice(1) end
end, { silent = true })

vim.keymap.set('n', '<leader><leader>r', ':source ~/.config/nvim/after/plugin/LuaSnip.lua <cr>')

vim.api.nvim_create_user_command('EditSnippets', function() require('luasnip.loaders').edit_snippet_files() end, {})

require('luasnip.loaders.from_lua').load { paths = '~/.config/nvim/snippets/' }

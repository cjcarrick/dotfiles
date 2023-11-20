local ls = require ('luasnip')

local ft_func
if pcall(require, 'treesitter') then
  ft_func = require('luasnip.extras.filetype_functions').from_cursor_pos
else
  ft_func = require('luasnip.extras.filetype_functions').from_filetype
end
  ft_func = require('luasnip.extras.filetype_functions').from_filetype

ls.config.set_config {
  history = true,
  updateEvents = 'TextChanged',
  enable_autosnippets = false,
  ft_func = ft_func,

  -- Also load both lua and json when a markdown-file is opened,
  -- javascript for html.
  -- Other filetypes just load themselves.
  load_ft_func = require('luasnip.extras.filetype_functions').extend_load_ft {
    vue = { 'typescript', 'javascript', 'scss', 'css' },
    svelte = { 'typescript', 'javascript', 'scss', 'css' },
  },

}

ls.filetype_extend('javascript', { 'ecma' })
ls.filetype_extend('typescript', { 'ecma' })

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

require('luasnip.loaders.from_lua').load { paths = '~/.config/nvim/snippets/' }

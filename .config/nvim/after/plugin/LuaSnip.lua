local ok, ls = pcall(require, 'luasnip')
if not ok then return end

local ft_func
if pcall(require, 'treesitter') then
  ft_func = require('luasnip.extras.filetype_functions').from_cursor_pos
else
  ft_func = require('luasnip.extras.filetype_functions').from_filetype
end

ls.config.set_config {
  history = true,
  updateEvents = 'TextChanged',
  enable_autosnippets = true,
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
  -- -- First try to move to the next field of a snippet
  -- local cursorPosPre = vim.api.nvim_win_get_cursor(0)
  -- local type = vim.fn['emmet#getFileType']()
  --
  -- vim.fn['emmet#lang#' .. type .. '#moveNextPrev'](1)
  -- local cursorPosPost = vim.api.nvim_win_get_cursor(0)
  --
  -- -- Then try to move to a luasnip field
  -- if (not cursorPosPre[1] == cursorPosPost[1]) or (not cursorPosPre[2] == cursorPosPost[2]) then
  --   if ls.jumpable(-1) then ls.jump(-1) end
  -- end

  if ls.jumpable(-1) then ls.jump(-1) end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<c-j>', function()
  -- -- First try to move to the next field of a snippet
  -- local cursorPosPre = vim.api.nvim_win_get_cursor(0)
  -- local type = vim.fn['emmet#getFileType']()
  -- vim.fn['emmet#lang#' .. type .. '#moveNextPrev'](0)
  -- local cursorPosPost = vim.api.nvim_win_get_cursor(0)
  --
  -- -- Then try to move to a luasnip field
  -- if (not cursorPosPre[1] == cursorPosPost[1]) or (not cursorPosPre[2] == cursorPosPost[2]) then
  --   if ls.expand_or_jumpable() then ls.expand_or_jump() end
  -- end

  if ls.expand_or_jumpable() then ls.expand_or_jump() end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<c-l>', function()
  if ls.choice_active() then ls.change_choice(1) end
end, { silent = true })

vim.api.nvim_create_user_command('EditSnippets', function() require('luasnip.loaders').edit_snippet_files() end, {})

require('luasnip.loaders.from_lua').load { paths = '~/.config/nvim/snippets/' }

vim.g.user_emmet_mode = 'inv' -- enable all functions, which is equal to
vim.g.user_emmet_leader_key = '<C-e>'

local set = vim.opt

-- Fixes italics in tmux
vim.cmd [[
set t_ZH=^[[3m
set t_ZR=^[[23m
]]

set.showtabline = 1
set.hidden = true

vim.api.nvim_create_user_command('Wa', ':wa', {})

-- Interface
set.list = true
set.listchars = 'tab:>-,trail:·' -- ,space:·
set.scrolloff = 4
set.sidescrolloff = 4
set.syntax = 'on'
set.wrap = false
set.cursorline = true
set.spellsuggest = set.spellsuggest + '10'
-- set.cmdheight = 0

-- Editing
set.textwidth = 80
set.linebreak = true -- break lines at word boundaries instead of at the middle of a word
-- set.formatoptions = 'jcroql'
-- set.formatoptions = 'jcroq/na'
set.diffopt = set.diffopt + 'iwhite' + 'iblank' + 'algorithm:patience'
set.foldmethod = 'indent'
set.foldenable = false

-- Sidebar
set.number = true
set.relativenumber = true
set.signcolumn = 'yes'
-- set.statuscolumn = '%=%{v:relnum?v:relnum:v:lnum}%s%C '
-- set.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- set.foldcolumn = '1'

-- Case insensitive commands
set.ignorecase = true
set.smartcase = true

-- Tabs
set.autoindent = true
set.expandtab = true
set.shiftwidth = 2
set.smartindent = true
set.softtabstop = 2
set.tabstop = 2

-- Automatically reload on file changes
-- https://superuser.com/a/1090762
set.autoread = true
vim.api.nvim_create_autocmd({ 'CursorHold' }, {
  pattern = '*',
  callback = function() vim.cmd 'checktime' end,
})

-- Backup files
set.backup = false
set.swapfile = false
set.writebackup = false

-- Filetypes
vim.filetype.add {
  filename = {
    ['tsconfig.json'] = 'jsonc',
    ['tsconfig.*.json'] = 'jsonc',
  },
}
vim.g.tex_flavor = 'latex'

-- Misc
set.mouse = 'a'
set.updatetime = 300
set.compatible = false -- I forget why this is here

-- Formatters
local fmt_cmds = {
  {
    {
      'astro',
      'css',
      'html',
      'javascript',
      'javascriptreact',
      'json',
      'jsonc',
      'markdown',
      'scss',
      'typescript',
      'typescriptreact',
      'vue',
      'xml',
      'yaml',
    },
    'prettier --stdin-filepath %',
  },

  {
    { 'c', 'cpp' },
    '/opt/clang-format-static/clang-format-16',
  },

  {
    { 'python', 'ipynb' },
    'black',
  },

  {
    { 'lua' },
    'stylua --search-parent-directories --stdin-filepath % -',
  },

  -- untested
  {
    { 'tex' },
    'latexindent -m -g /dev/null -y "modifyLineBreaks:textWrapOptions:columns:80"',
  },
}

for _, c in pairs(fmt_cmds) do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = c[1],
    callback = function() vim.opt_local.formatprg = c[2] end,
  })
end

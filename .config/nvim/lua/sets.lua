local set = vim.opt

-- Fixes italics in tmux
vim.cmd [[
set t_ZH=^[[3m
set t_ZR=^[[23m
]]

set.showtabline = 1
set.hidden = true

-- Interface
set.list = true
set.listchars = 'tab:>-,trail:·' -- ,space:·
set.scrolloff = 4
set.sidescrolloff = 4
set.syntax = 'on'
set.wrap = false
set.cursorline = true

-- Editing
set.tw = 80
-- set.formatoptions = 'jcroql'
-- set.formatoptions = 'jcroq/na'
set.diffopt = set.diffopt + 'iwhite' + 'iblank' + 'algorithm:patience'

-- Sidebar
set.number = true
set.relativenumber = true
set.signcolumn = 'yes'

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

-- Misc
set.mouse = 'a'
set.updatetime = 300
set.compatible = false -- I forget why this is here

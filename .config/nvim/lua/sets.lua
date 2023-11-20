vim.g.user_emmet_mode = 'inv' -- enable all functions, which is equal to
vim.g.user_emmet_expandabbr_key = '<C-y>,'

-- -- this is a complete hack but it works super well
-- vim.api.nvim_create_autocmd('TextChangedI', {
--   callback = function()
--     local row, col = unpack(vim.api.nvim_win_get_cursor(0))
--     if col <= 3 then return end
--     local last_three_chars = vim.api.nvim_buf_get_text(0, row - 1, col - 3, row - 1, col, {})[1]
--     local next_char = vim.api.nvim_buf_get_text(0, row - 1, col, row - 1, col + 1, {})[1]
--     if last_three_chars:sub(3, 3) ~= '>' then return end
--     if last_three_chars:sub(2, 2) == '>' and last_three_chars:sub(1, 1) ~= '>' then
--       -- indent
--       if next_char == '<' then
--         vim.api.nvim_input '<bs><cr><cr><C-o>k<tab>'
--       -- insert emmet abbr
--       else
--         vim.api.nvim_input '<bs><bs><C-y>,'
--       end
--     end
--   end,
-- })

-- Fixes italics in tmux
vim.cmd [[
set t_ZH=^[[3m
set t_ZR=^[[23m
]]

vim.opt.showtabline = 1
vim.opt.hidden = true

vim.api.nvim_create_user_command('Wa', ':wa', {})

-- Interface
vim.opt.list = true
vim.opt.listchars = 'tab:>-,trail:·' -- ,space:·
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 4
vim.opt.syntax = 'on'
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.cursorline = true
vim.opt.spellsuggest = vim.opt.spellsuggest + '10'
-- vim.opt.cmdheight = 0

-- Editing
vim.opt.textwidth = 80
vim.opt.linebreak = true -- break lines at word boundaries instead of at the middle of a word
vim.opt.formatoptions = 'jcroql'
-- vim.opt.formatoptions = 'jcroq/na'
vim.opt.diffopt = vim.opt.diffopt + 'iwhite' + 'iblank' + 'algorithm:patience'
vim.opt.foldmethod = 'indent'
vim.opt.foldenable = false

-- Sidebar
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
-- vim.opt.statuscolumn = '%=%{v:relnum?v:relnum:v:lnum}%s%C '
-- vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- vim.opt.foldcolumn = '1'

-- Case insensitive commands
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Tabs
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smarttab = false
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- Automatically reload on file changes
-- https://superuser.com/a/1090762
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ 'CursorHold' }, {
  pattern = '*',
  callback = function() vim.cmd 'checktime' end,
})

-- Backup files
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false

-- Filetypes
vim.filetype.add {
  filename = {
    ['tsconfig.json'] = 'jsonc',
    ['tsconfig.*.json'] = 'jsonc',
  },
}
vim.g.tex_flavor = 'latex'

-- Misc
vim.opt.mouse = 'a'
vim.opt.updatetime = 300
vim.opt.compatible = false -- I forget why this is here

-- Formatters
local fmt_cmds = {
  {
    {
      'astro',
      'css',
      'html',
      'javascriptreact',
      'jsonc',
      'markdown',
      'scss',
      'typescript',
      'typescriptreact',
      'vue',
      'xml',
      'yaml',
    },
    'prettier --config $HOME/.config/nvim/.prettierrc.json --prose-wrap always --stdin-filepath %',
  },

  {
    { 'javascript' },
    '$HOME/projects/format/format',
  },

  -- {
  --   { 'json' },
  --   'jq .',
  -- },

  {
    { 'c', 'cpp', 'typescript', 'json' },
    'clang-format --assume-filename=%',
  },

  {
    { 'python', 'ipynb' },
    'black',
  },

  {
    { 'lua' },
    'stylua --search-parent-directories --stdin-filepath % -',
  },
}

for _, c in pairs(fmt_cmds) do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = c[1],
    callback = function()
      vim.opt_local.formatexpr = ''
      vim.opt_local.formatprg = c[2]
    end,
  })
end

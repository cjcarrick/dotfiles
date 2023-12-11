-- Tabs
vim.o.autoindent = false
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2

-- Soft wrap text
vim.opt_local.tw = 999
vim.opt_local.wrap = true
-- ...and indent lists
vim.opt.breakindent = true
vim.opt.breakindentopt = 'list:-1'

local ok, autolist = pcall(require, 'autolist')
if not ok then return end

autolist.setup()

local function ft_map(keys, cmd, ft)
  return keys,
    function()
      if vim.bo.ft == ft then return vim.cmd(cmd) end
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, true, true), 'n', false)
    end
end

-- vim.keymap.set('i', ft_map('<tab>', '<cmd>AutolistTab<cr>', 'markdown'))
-- vim.keymap.set('i', ft_map('<s-tab>', '<cmd>AutolistShiftTab<cr>', 'markdown'))
-- vim.keymap.set('i', ft_map('<CR>', '<CR><cmd>AutolistNewBullet<cr>', 'markdown'))
-- vim.keymap.set('n', ft_map('o', 'o<cmd>AutolistNewBullet<cr>', 'markdown'))
-- vim.keymap.set('n', ft_map('O', 'O<cmd>AutolistNewBulletBefore<cr>', 'markdown'))
-- vim.keymap.set('n', ft_map('<CR>', '<cmd>AutolistToggleCheckbox<cr><CR>', 'markdown'))
-- vim.keymap.set('n', ft_map('>>', '>><cmd>AutolistRecalculate<cr>', 'markdown'))
-- vim.keymap.set('n', ft_map('<<', '<<<cmd>AutolistRecalculate<cr>', 'markdown'))
-- vim.keymap.set('n', ft_map('dd', 'dd<cmd>AutolistRecalculate<cr>', 'markdown'))
-- vim.keymap.set('v', ft_map('d', 'd<cmd>AutolistRecalculate<cr>', 'markdown'))

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

vim.keymap.set('i', '<tab>', '<cmd>AutolistTab<cr>')
vim.keymap.set('i', '<s-tab>', '<cmd>AutolistShiftTab<cr>')
-- vim.keymap.set("i", "<c-t>", "<c-t><cmd>AutolistRecalculate<cr>") -- an example of using <c-t> to indent
vim.keymap.set('i', '<CR>', '<CR><cmd>AutolistNewBullet<cr>')
vim.keymap.set('n', 'o', 'o<cmd>AutolistNewBullet<cr>')
vim.keymap.set('n', 'O', 'O<cmd>AutolistNewBulletBefore<cr>')
vim.keymap.set('n', '<CR>', '<cmd>AutolistToggleCheckbox<cr><CR>')
-- vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>") -- this broke redo

-- cycle list types with dot-repeat
-- vim.keymap.set('n', '<leader>cn', require('autolist').cycle_next_dr, { expr = true })
-- vim.keymap.set('n', '<leader>cp', require('autolist').cycle_prev_dr, { expr = true })

-- if you don't want dot-repeat
-- vim.keymap.set("n", "<leader>cn", "<cmd>AutolistCycleNext<cr>")
-- vim.keymap.set("n", "<leader>cp", "<cmd>AutolistCycleNext<cr>")

-- functions to recalculate list on edit
vim.keymap.set('n', '>>', '>><cmd>AutolistRecalculate<cr>')
vim.keymap.set('n', '<<', '<<<cmd>AutolistRecalculate<cr>')
vim.keymap.set('n', 'dd', 'dd<cmd>AutolistRecalculate<cr>')
vim.keymap.set('v', 'd', 'd<cmd>AutolistRecalculate<cr>')

vim.g.AutoPairsCenterLine = 0

-- vim.api.nvim_create_autocmd({ 'FileType' }, {
--   pattern = { 'html' },
--   callback = function()
--     vim.b.AutoPairs = vim.fn.AutoPairsDefine {
--       ['<!--'] = '-->',
--       -- ['<([^ ]+)+.*>\zs'] = '<([^ ]+)+.*>\zs',
--       -- ['<([^ ]+)+.*> \zs'] = ' <([^ ]+)+.*>\zs',
--     }
--   end,
-- })

-- vim.cmd [[ au FileType html let b:AutoPairs = AutoPairsDefine({  '<!--': '-->', '\<\(\[^ \]+\)\+\.\*>\zs' : 'fff'}, []) ]]
-- vim.cmd [[ au FileType html let b:AutoPairs = AutoPairsDefine({'<\(\w\|-\)\+\.\{-}>':'<\/\(\w\|-\)\+>'}, []) ]]

vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'typescript', 'javascript' },
  callback = function() vim.b.AutoPairs = vim.fn.AutoPairsDefine { ['/**'] = '*/' } end,
})

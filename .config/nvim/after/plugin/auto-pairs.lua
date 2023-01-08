vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'html' },
  callback = function() vim.b.AutoPairs = vim.fn.AutoPairsDefine { ['<!--'] = '-->' } end,
})

vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'typescript', 'javascript' },
  callback = function() vim.b.AutoPairs = vim.fn.AutoPairsDefine { ['/**'] = '*/' } end,
})

vim.g.AutoPairsCenterLine = 0

vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'html' },
  callback = function()
    vim.b.AutoPairs = vim.fn.AutoPairsDefine {
      ['<!--'] = '-->',
      ['>'] = '<', -- not perfect, but it works well with ls_emmet. Now after accepting one of emmet's suggestions, pressing <cr> will be nicely formatted
    }
  end,
})

-- vim.cmd [[ au FileType html let b:AutoPairs = AutoPairsDefine({'<\(\w\|-\)\+\.\{-}>':'<\/\(\w\|-\)\+>\zs'}, []) ]]

vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'typescript', 'javascript', 'cpp' },
  callback = function() vim.b.AutoPairs = vim.fn.AutoPairsDefine { ['/**'] = '*/' } end,
})

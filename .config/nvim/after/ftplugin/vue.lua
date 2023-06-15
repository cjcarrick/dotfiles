local aufunc = require 'autocmd'

vim.api.nvim_create_autocmd('InsertCharPre', { callback = aufunc.css_rule_nexline })

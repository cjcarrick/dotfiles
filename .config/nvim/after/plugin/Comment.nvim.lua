if pcall(require, 'Comment') then
  local ft = require 'Comment.ft'
  require('Comment').setup {}
  ft.scss = { '// %s', '/* %s */' }
end

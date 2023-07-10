local ok, comment = pcall(require, 'Comment')
if not ok then return end

local ft = require 'Comment.ft'

comment.setup {}

ft.scss = { '// %s', '/* %s */' }

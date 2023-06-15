M = {}

M.css_rule_nexline = function()
  -- When ; is pressed
  if vim.v.char ~= ';' then return end

  local line = vim.api.nvim_get_current_line()

  -- Check that there is a ; at the end of the line
  if line:sub(-1) ~= ';' then return end

  -- Check that we are standing just before the semicolon at the end of the
  -- line
  local pos = vim.api.nvim_win_get_cursor(0)
  if pos[2] ~= (line:len() - 1) then return end

  -- Move cursor down to insert another line of css
  local key = vim.api.nvim_replace_termcodes('<C-o>o', true, false, true)
  vim.api.nvim_feedkeys(key, 'n', false)

  -- Don't insert semicolon
  vim.v.char = ''
end

return M

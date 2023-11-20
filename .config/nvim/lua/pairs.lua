local MAX_LINES_FOR_SEARCH = 100

---@return integer,integer # row,col of the cursor; both are 0-based indices
local function pos()
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  return r - 1, c
end

---@return integer #number of lines in a file
local function num_lines()
  return vim.api.nvim_buf_line_count(0)
end

local my_pairs = {
  ['{'] = { '}' },
  ['['] = { ']' },
  ['('] = { ')' },
  ['"'] = { '"', map_cr = false },
  ['"""'] = { '"""', indent_on_cr = false },
  ["'"] = { "'", map_cr = false },
  ["`"] = { "`", map_cr = false },
  ["``"] = { "''", map_cr = false },
  ['```'] = { '```', indent_on_cr = false },
  ['<!--'] = { '-->' },
}

---@param char string
local function is_whitespace(char) return not not char:find '[ \t\n]' end

---Returns true if the given string is found after the cursor. Skips over
---whitespace to find it.
---@param str string
---@param opts { immediately_after_cursor: boolean }?
---@return integer|nil,integer|nil # row, col of the first char of the string in the buffer. Both are 0-based.
local function search_forwards(str, opts)
  local row, col = pos()

  if opts and opts.immediately_after_cursor ~= nil and opts.immediately_after_cursor then
    local after_cursor = vim.api.nvim_buf_get_text(0, row, col - #str, row, col, {})[1]
    if after_cursor == str then
      return row, col - #str
    end
    return
  end

  local after = vim.api.nvim_buf_get_lines(0, row, math.min(row + MAX_LINES_FOR_SEARCH, num_lines()), true)
  local str_char_i = 1

  for r = 1, #after, 1 do
    local line = after[r]

    -- We get an array of lines, and search through each line looking for the
    -- opener. But for the first line, we need to start the search from the
    -- cursor's column, not from the first column of the line:
    -- {
    --    "...... . |... . . . ",
    --    "... ......... ... . . . ",
    --    "... . ... ... . . ",
    --    "... . ...... . . . "
    -- }

    local c_start = 1
    if r == 1 then c_start = col + 1 end
    for c = c_start, #line do
      local ch = line:sub(c, c)
      if not is_whitespace(ch) then
        if ch == str:sub(str_char_i, str_char_i) then
          str_char_i = str_char_i + 1
          if str_char_i > #str then return row + r - 1, c - #str end
        else
          return
        end
      end
    end

    col = 1
  end
end

---@param str string specify which string to look for
---@param opts { immediately_before_cursor: boolean, from: { [0]: number, [1]: number } }?
---@return integer|nil,integer|nil #the row, col of the first char of the
---closing pair in the buffer. Both indices are 0-based
local function search_backwards(str, opts)

  local row, col
  if opts and opts.from then
    row, col = opts.from[1], opts.from[2]
  else
    row, col = pos()
  end

  if opts and opts.immediately_before_cursor ~= nil and opts.immediately_before_cursor then
    if col < #str then return end
    local before_cursor = vim.api.nvim_buf_get_text(0, row, col - #str, row, col, {})[1]
    if before_cursor == str then
      return row, col - #str
    end
    return
  end

  local before = vim.api.nvim_buf_get_lines(0, math.max(row - MAX_LINES_FOR_SEARCH - 1, 0), row + 1, true)

  local str_char_i = #str

  for r = #before, 1, -1 do

    local line = before[r]
    -- string can't fit on this line, just skip it
    if #line >= #str then

    local c_begin = 1
    if r == #before then c_begin = col end
    for c = c_begin, 1, -1 do
      local char = line:sub(c, c)
      if not is_whitespace(char) then
        if char == str:sub(str_char_i, str_char_i) then
          str_char_i = str_char_i - 1
          if str_char_i == 0 then return row - #before + r, c - 1 end
        else
          return
        end
      end
    end

    end


  end
end

local function fallback_keymap(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), 'n', false)
end

local function spaces_balanced(col, opener, opener_r, opener_c, closer, closer_r, closer_c)
  return (opener_r == closer_r) and ((col - opener_c - #opener) == (closer_c - col))
end

vim.opt.showmode = false
for opener, opts in pairs(my_pairs) do

  local first_char = opts[1]:sub(1, 1)
  vim.keymap.set('i', first_char, function()
    local opener_r, opener_c = search_backwards(opener)
    local closer_r, closer_c = search_forwards(opts[1])
    print(first_char, closer_r, closer_c)
    if closer_r and opener_r then
      local row, col = pos()

      -- {       {
      -- |  -->  |}
      -- } 
      if opener_r == row -1 and closer_r == row + 1 then
        vim.api.nvim_buf_set_text(0, opener_r, opener_c + #opener, closer_r, closer_c, {'', ''})
        closer_r = closer_r - 1

      -- {  |  }  -->  {  |}
      elseif spaces_balanced(col, opener, opener_r, opener_c, opts, closer_r, closer_c) then
        vim.api.nvim_buf_set_text(0, closer_r, col, closer_r, closer_c, {})
      end

      -- { |   }  -->  {    }|
      return vim.api.nvim_win_set_cursor(0, { closer_r + 1, closer_c + #opts })

    else
      fallback_keymap(first_char)
    end
  end)

  local last_char = opener:sub(#opener, #opener)
  vim.keymap.set('i', last_char, function()
    -- Check if adding this last char would complete the opener
    local row, col = pos()
    local before_cursor = ''
    if col + 1 >= #opener then before_cursor = vim.api.nvim_buf_get_text(0, row, col - #opener + 1, row, col, {})[1] end

    if before_cursor .. last_char == opener then
      local closer_r = search_forwards(opts[1])

      -- auto-add closer when the opener is inserted
      if closer_r == nil then
        vim.api.nvim_put({ last_char }, 'c', false, true)
        vim.api.nvim_put({ opts[1] }, 'c', false, false)
        return
      else
        -- This handles the case when the opener is already placed, but the
        -- closer isn't for some reason
        local opener_r = search_backwards(opener)
        if opener_r then
          vim.api.nvim_put({ opts[1] }, 'c', false, false)
          return
        end
      end
    end

    fallback_keymap(last_char)
  end)
end

vim.keymap.set('i', '<bs>', function()
  local row, col = pos()

  for opener, opts in pairs(my_pairs) do
    local opener_r, opener_c = search_backwards(opener)
    local closer_r, closer_c = search_forwards(opts[1])
    print(opener, opts[1], 'bs', opener_r, opener_c, closer_r, closer_c)

    if opener_r and closer_r then
      local immediately_before_cursor = opener_r == row and opener_c + #opener == col
      if immediately_before_cursor then
        -- (|)   -->    |
        return vim.api.nvim_buf_set_text(0, row, opener_c, closer_r, closer_c + #opts, {})
      end

      -- (  |  )  --> ( | )
      if spaces_balanced(col, opener, opener_r, opener_c, opts[1], closer_r, closer_c) then
        return vim.api.nvim_buf_set_text(0, row, col - 1, row, col + 1, {})
      end

      -- {         {|}
      -- |    ->
      -- }
      print('ooooo')
      if opener_r == row - 1 and closer_r == row + 1 and col == 0 then
        vim.api.nvim_buf_set_text(0, opener_r, opener_c + #opener, closer_r, closer_c, {})
        return
      end
    end
  end

  fallback_keymap '<bs>'
end, { remap = false })

vim.keymap.set('i', '<space>', function()
  local row, col = pos()

  for opener, opts in pairs(my_pairs) do
    local opener_r, opener_c = search_backwards(opener)
    local closer_r, closer_c = search_forwards(opts[1])

    -- ( | )  --> (  |  )
    if row == opener_r and row == closer_r then
      -- make sure spaces are already balanced
      if (col - opener_c - #opener) == (closer_c - col) then
        vim.api.nvim_put({ ' ' }, 'c', false, true)
        vim.api.nvim_put({ ' ' }, 'c', false, false)
        return
      end
    end
  end

  fallback_keymap '<space>'
end)

vim.keymap.set('i', '<cr>', function()
  -- {|}    ->    {
  --                  |
  --              }

  for opener, closer in pairs(my_pairs) do
    if closer.map_cr == false then goto next end

    local row, col = pos()

    local opener_r, opener_c = search_backwards(opener)
    if opener_r then
      local closer_r, closer_c = search_forwards(closer[1])
      if closer_r == opener_r then
        local existing_indent = vim.fn.indent(row + 1)
        local new_indent = string.rep(' ', existing_indent)
        if closer.indent_on_cr ~= false then
          new_indent = string.rep(' ', vim.bo.tabstop * (1 + existing_indent))
        end
        vim.api.nvim_buf_set_text(0, opener_r, opener_c + #opener, closer_r, closer_c, {
          '',
          new_indent,
          string.rep(' ', existing_indent)
        })
        vim.api.nvim_win_set_cursor(0, { opener_r + 2, #new_indent })
        return
      end
    end

    ::next::
  end

  fallback_keymap '<cr>'
end)

-- for opener, closer in pairs(my_pairs) do
--   -- auto-add closer when the opener is inserted
--   print(opener)
--   vim.keymap.set('i', opener, function()
--     print('open', opener)
--     vim.api.nvim_put({ opener }, 'c', false, true)
--     local closer_r = find_closing_pair(opener)
--     print(closer_r)
--     if closer_r == nil then vim.api.nvim_put({ closer }, 'c', false, false) end
--   end)
--
--   if #closer == 1 then
--     vim.keymap.set('i', closer, function()
--       local r, c = pos()
--
--       -- {| -> {}|
--       -- (This is just the default mapping)
--       local closer_r, closer_c = find_closing_pair(opener)
--       if closer_r == nil then
--         vim.api.nvim_put({ closer }, 'c', false, true)
--       else
--
--         -- {|}  -> {}|
--         --
--         -- {    |    }  -> {    }|
--         --
--         -- {                 {
--         --     |        ->   }|
--         -- }
--         --
--         -- {                     {
--         --     foo;|        ->       foo;
--         -- }                     }|
--         local erase_from_row = closer_r - 1
--         local erase_from_col = c
--         local multiline = closer_r - r >= 1
--         local move_down = multiline
--         if multiline then
--           erase_from_col = closer_c - 1
--           local this_line = vim.api.nvim_buf_get_lines(0, r-1, r, false)[1]
--           if this_line:match("^ +$") then
--             erase_from_row = r - 1
--             move_down = false
--           end
--         end
--         vim.api.nvim_buf_set_text(0, erase_from_row, erase_from_col, closer_r - 1, closer_c - 1, {})
--         if move_down then
--           vim.api.nvim_win_set_cursor(0, { r + 1, closer_c + 1 })
--         else
--           vim.api.nvim_win_set_cursor(0, { r, c + 1 })
--         end
--
--
--       end
--     end)
--   end
-- end
--
-- vim.opt.showmode = false
-- vim.keymap.set('i', '<bs>', function()
--   local r, c = pos()
--   local opener, opener_r, opener_c = find_opening_pair()
--   if opener == nil then  return fallback_keymap '<bs>' end
--
--   local closer_r, closer_c = find_closing_pair(opener)
--   if closer_r == nil then return  fallback_keymap '<bs>' end
--
--   -- keep spaces balanced by removing a space before and after the cursor when
--   -- deleting a space
--   if r == opener_r and r == closer_r then
--     -- make sure spaces are already balanced
--     if c + 1 - opener_c == closer_c - c then
--       return vim.api.nvim_buf_set_text(0, r - 1, c - 1, r - 1, c + 1, {})
--     end
--   end
--
--   -- auto-remove closer when the opener is deleted with <bs>
--   print(opener_c, c, closer_c)
--   if opener_r == r and c == opener_c + #opener then
--     return vim.api.nvim_buf_set_text(0, r - 1, opener_c - 2 - #opener, closer_r - 1, closer_c -1+ #my_pairs[opener], {})
--   end
--
--   -- join lines when opener and closer span multiple lines
--   -- {         {|}                     {            {|}
--   -- |   ->                or          |      ->
--   -- }                                   }
--   print(closer_r - opener_r, opener_c, c, closer_c)
--   if closer_r - opener_r == 2 and opener_c - 1 == c then
--     vim.api.nvim_buf_set_text(0, opener_r - 1, opener_c, r, c, {})
--     return
--   end
--
--
--
--   fallback_keymap '<bs>'
-- end, { remap = false })
--
-- -- auto-balance spaces inside of the pairs
-- vim.keymap.set('i', '<space>', function()
--
--   local r, c = pos()
--
--   -- you need a space before no matter what
--   fallback_keymap '<space>'
--
--   local opener, opener_r, opener_c = find_opening_pair()
--
--   -- ensure opener exists and is on the same line as the cursor
--   if opener == nil or r ~= opener_r then return print('no opener on this line') end
--
--   local closer_r, closer_c = find_closing_pair(opener)
--   -- ensure closer exists and is on the same line as the cursor
--   if closer_r == nil or r ~= closer_r then return print('no closer on this line') end
--
--   -- ensure that the spaces before and after the cursor are already balanced
--   if c + 1 - opener_c == closer_c - c then
--     vim.api.nvim_put({ ' ' }, 'c', false, false)
--   end
-- end)
--
-- vim.keymap.set('i', '<cr>', function()
--   -- {|}    ->    {
--   --                  |
--   --              }
--
--   local r, c = pos()
--
--   local opener, opener_r, opener_c = find_opening_pair()
--   if opener == nil then return fallback_keymap('<cr>') end
--
--   local closer_r, closer_c = find_closing_pair(opener)
--   if closer_r == nil then return fallback_keymap('<cr>') end
--
--   if closer_r ~= opener_r then return fallback_keymap('<cr>') end
--
--   local existing_indent = vim.fn.indent(r)
--   vim.api.nvim_put({'', string.rep(" ", vim.bo.tabstop + existing_indent) }, 'c', false, true)
--   vim.api.nvim_put({'', string.rep(" ", existing_indent)}, 'c', false, false)
-- end)
--   if #closer == 1 then
--     vim.keymap.set('i', closer, function()
--       local r, c = pos()
--
--       -- {| -> {}|
--       -- (This is just the default mapping)
--       local closer_r, closer_c = find_closing_pair(opener)
--       if closer_r == nil then
--         vim.api.nvim_put({ closer }, 'c', false, true)
--       else
--
--         -- {|}  -> {}|
--         --
--         -- {    |    }  -> {    }|
--         --
--         -- {                 {
--         --     |        ->   }|
--         -- }
--         --
--         -- {                     {
--         --     foo;|        ->       foo;
--         -- }                     }|
--         local erase_from_row = closer_r - 1
--         local erase_from_col = c
--         local multiline = closer_r - r >= 1
--         local move_down = multiline
--         if multiline then
--           erase_from_col = closer_c - 1
--           local this_line = vim.api.nvim_buf_get_lines(0, r-1, r, false)[1]
--           if this_line:match("^ +$") then
--             erase_from_row = r - 1
--             move_down = false
--           end
--         end
--         vim.api.nvim_buf_set_text(0, erase_from_row, erase_from_col, closer_r - 1, closer_c - 1, {})
--         if move_down then
--           vim.api.nvim_win_set_cursor(0, { r + 1, closer_c + 1 })
--         else
--           vim.api.nvim_win_set_cursor(0, { r, c + 1 })
--         end
--
--
--       end
--     end)
--   end
-- end
--
-- vim.opt.showmode = false
-- vim.keymap.set('i', '<bs>', function()
--   local r, c = pos()
--   local opener, opener_r, opener_c = find_opening_pair()
--   if opener == nil then  return fallback_keymap '<bs>' end
--
--   local closer_r, closer_c = find_closing_pair(opener)
--   if closer_r == nil then return  fallback_keymap '<bs>' end
--
--   -- keep spaces balanced by removing a space before and after the cursor when
--   -- deleting a space
--   if r == opener_r and r == closer_r then
--     -- make sure spaces are already balanced
--     if c + 1 - opener_c == closer_c - c then
--       return vim.api.nvim_buf_set_text(0, r - 1, c - 1, r - 1, c + 1, {})
--     end
--   end
--
--   -- auto-remove closer when the opener is deleted with <bs>
--   print(opener_c, c, closer_c)
--   if opener_r == r and c == opener_c + #opener then
--     return vim.api.nvim_buf_set_text(0, r - 1, opener_c - 2 - #opener, closer_r - 1, closer_c -1+ #my_pairs[opener], {})
--   end
--
--   -- join lines when opener and closer span multiple lines
--   -- {         {|}                     {            {|}
--   -- |   ->                or          |      ->
--   -- }                                   }
--   print(closer_r - opener_r, opener_c, c, closer_c)
--   if closer_r - opener_r == 2 and opener_c - 1 == c then
--     vim.api.nvim_buf_set_text(0, opener_r - 1, opener_c, r, c, {})
--     return
--   end
--
--
--
--   fallback_keymap '<bs>'
-- end, { remap = false })
--
-- -- auto-balance spaces inside of the pairs
-- vim.keymap.set('i', '<space>', function()
--
--   local r, c = pos()
--
--   -- you need a space before no matter what
--   fallback_keymap '<space>'
--
--   local opener, opener_r, opener_c = find_opening_pair()
--
--   -- ensure opener exists and is on the same line as the cursor
--   if opener == nil or r ~= opener_r then return print('no opener on this line') end
--
--   local closer_r, closer_c = find_closing_pair(opener)
--   -- ensure closer exists and is on the same line as the cursor
--   if closer_r == nil or r ~= closer_r then return print('no closer on this line') end
--
--   -- ensure that the spaces before and after the cursor are already balanced
--   if c + 1 - opener_c == closer_c - c then
--     vim.api.nvim_put({ ' ' }, 'c', false, false)
--   end
-- end)
--
-- vim.keymap.set('i', '<cr>', function()
--   -- {|}    ->    {
--   --                  |
--   --              }
--
--   local r, c = pos()
--
--   local opener, opener_r, opener_c = find_opening_pair()
--   if opener == nil then return fallback_keymap('<cr>') end
--
--   local closer_r, closer_c = find_closing_pair(opener)
--   if closer_r == nil then return fallback_keymap('<cr>') end
--
--   if closer_r ~= opener_r then return fallback_keymap('<cr>') end
--
--   local existing_indent = vim.fn.indent(r)
--   vim.api.nvim_put({'', string.rep(" ", vim.bo.tabstop + existing_indent) }, 'c', false, true)
--   vim.api.nvim_put({'', string.rep(" ", existing_indent)}, 'c', false, false)
-- end)

-- for opener, closer in pairs(my_pairs) do
--   -- auto-add closer when the opener is inserted
--   print(opener)
--   vim.keymap.set('i', opener, function()
--     print('open', opener)
--     vim.api.nvim_put({ opener }, 'c', false, true)
--     local closer_r = find_closing_pair(opener)
--     print(closer_r)
--     if closer_r == nil then vim.api.nvim_put({ closer }, 'c', false, false) end
--   end)
--
--   if #closer == 1 then
--     vim.keymap.set('i', closer, function()
--       local r, c = pos()
--
--       -- {| -> {}|
--       -- (This is just the default mapping)
--       local closer_r, closer_c = find_closing_pair(opener)
--       if closer_r == nil then
--         vim.api.nvim_put({ closer }, 'c', false, true)
--       else
--
--         -- {|}  -> {}|
--         --
--         -- {    |    }  -> {    }|
--         --
--         -- {                 {
--         --     |        ->   }|
--         -- }
--         --
--         -- {                     {
--         --     foo;|        ->       foo;
--         -- }                     }|
--         local erase_from_row = closer_r - 1
--         local erase_from_col = c
--         local multiline = closer_r - r >= 1
--         local move_down = multiline
--         if multiline then
--           erase_from_col = closer_c - 1
--           local this_line = vim.api.nvim_buf_get_lines(0, r-1, r, false)[1]
--           if this_line:match("^ +$") then
--             erase_from_row = r - 1
--             move_down = false
--           end
--         end
--         vim.api.nvim_buf_set_text(0, erase_from_row, erase_from_col, closer_r - 1, closer_c - 1, {})
--         if move_down then
--           vim.api.nvim_win_set_cursor(0, { r + 1, closer_c + 1 })
--         else
--           vim.api.nvim_win_set_cursor(0, { r, c + 1 })
--         end
--
--
--       end
--     end)
--   end
-- end
--
-- vim.opt.showmode = false
-- vim.keymap.set('i', '<bs>', function()
--   local r, c = pos()
--   local opener, opener_r, opener_c = find_opening_pair()
--   if opener == nil then  return fallback_keymap '<bs>' end
--
--   local closer_r, closer_c = find_closing_pair(opener)
--   if closer_r == nil then return  fallback_keymap '<bs>' end
--
--   -- keep spaces balanced by removing a space before and after the cursor when
--   -- deleting a space
--   if r == opener_r and r == closer_r then
--     -- make sure spaces are already balanced
--     if c + 1 - opener_c == closer_c - c then
--       return vim.api.nvim_buf_set_text(0, r - 1, c - 1, r - 1, c + 1, {})
--     end
--   end
--
--   -- auto-remove closer when the opener is deleted with <bs>
--   print(opener_c, c, closer_c)
--   if opener_r == r and c == opener_c + #opener then
--     return vim.api.nvim_buf_set_text(0, r - 1, opener_c - 2 - #opener, closer_r - 1, closer_c -1+ #my_pairs[opener], {})
--   end
--
--   -- join lines when opener and closer span multiple lines
--   -- {         {|}                     {            {|}
--   -- |   ->                or          |      ->
--   -- }                                   }
--   print(closer_r - opener_r, opener_c, c, closer_c)
--   if closer_r - opener_r == 2 and opener_c - 1 == c then
--     vim.api.nvim_buf_set_text(0, opener_r - 1, opener_c, r, c, {})
--     return
--   end
--
--
--
--   fallback_keymap '<bs>'
-- end, { remap = false })
--
-- -- auto-balance spaces inside of the pairs
-- vim.keymap.set('i', '<space>', function()
--
--   local r, c = pos()
--
--   -- you need a space before no matter what
--   fallback_keymap '<space>'
--
--   local opener, opener_r, opener_c = find_opening_pair()
--
--   -- ensure opener exists and is on the same line as the cursor
--   if opener == nil or r ~= opener_r then return print('no opener on this line') end
--
--   local closer_r, closer_c = find_closing_pair(opener)
--   -- ensure closer exists and is on the same line as the cursor
--   if closer_r == nil or r ~= closer_r then return print('no closer on this line') end
--
--   -- ensure that the spaces before and after the cursor are already balanced
--   if c + 1 - opener_c == closer_c - c then
--     vim.api.nvim_put({ ' ' }, 'c', false, false)
--   end
-- end)
--
-- vim.keymap.set('i', '<cr>', function()
--   -- {|}    ->    {
--   --                  |
--   --              }
--
--   local r, c = pos()
--
--   local opener, opener_r, opener_c = find_opening_pair()
--   if opener == nil then return fallback_keymap('<cr>') end
--
--   local closer_r, closer_c = find_closing_pair(opener)
--   if closer_r == nil then return fallback_keymap('<cr>') end
--
--   if closer_r ~= opener_r then return fallback_keymap('<cr>') end
--
--   local existing_indent = vim.fn.indent(r)
--   vim.api.nvim_put({'', string.rep(" ", vim.bo.tabstop + existing_indent) }, 'c', false, true)
--   vim.api.nvim_put({'', string.rep(" ", existing_indent)}, 'c', false, false)
-- end)

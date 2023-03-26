function Start()
  -- " Don't run if: we have commandline arguments, we don't have an empty
  -- " buffer, if we've not invoked as vim or gvim, or if we'e start in insert mode
  --
  -- if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
  --     return
  -- endif

  -- " Start a new buffer ...
  -- enew
  vim.cmd [[ enew ]]

  -- " ... and set some options for it
  -- setlocal
  --     \ bufhidden=wipe
  --     \ buftype=nofile
  --     \ nobuflisted
  --     \ nocursorcolumn
  --     \ nocursorline
  --     \ nolist
  --     \ nonumber
  --     \ noswapfile
  --     \ norelativenumber

  -- vim.bo.bufhidden = 'wipe'
  -- vim.bo.buftype = 'nofile'
  -- vim.bo.buflisted = false
  -- vim.wo.list = false
  -- vim.bo.swapfile = false

  vim.wo.cursorline = false
  vim.wo.number = false
  vim.wo.relativenumber = false
  vim.wo.signcolumn = 'no'

  local a = vim.cmd 'version'

  local ascii = {
    [[        _____]],
    [[      /  ___  \]],
    [[    /  /  _  \  \]],
    [[  /( /( /(_)\ )\ )\]],
    [[ (  \  \ ___ /  /  )]],
    [[ (    \ _____ /    )]],
    [[ /(               )\]],
    [[|  \             /  |]],
    [[|    \ _______ /    |]],
    [[ \    / \   / \    /]],
    [[   \/    | |    \/]],
    [[         | |]],
    [[         | |]],
    [[         | |]],
  }

  -- " Now we can just write to the buffer, whatever you want.
  -- call append('$', "")
  local lines_avail = vim.fn.winheight '0'

  -- Vertical align
  -- for i = 0, math.floor(lines_avail / 2 - #ascii / 2), 1 do
  --   table.insert(ascii, 0, 'string')
  -- end

  string.lpad = function(str, len, char) return string.rep(char, len - #str) .. str end

  local function map(tbl, f)
    local t = {}
    for k, v in pairs(tbl) do
      t[k] = f(v)
    end
    return t
  end

  -- Horizontal align
  local cols_avail = vim.fn.winwidth '0'
  local maxwidth = math.max(unpack(map(ascii, function(line) return string.len(line) end)))
  for i, line in pairs(ascii) do
    ascii[i] = string.rep(' ', math.floor((cols_avail - maxwidth) / 2)) .. line
  end

  for key, value in pairs(ascii) do
    print(key, value, type(value))
  end

  vim.api.nvim_buf_set_lines(
    0,
    math.floor(lines_avail / 2 - #ascii / 2),
    math.floor(lines_avail / 2 + #ascii / 2),
    false,
    ascii
  )

  -- for line in split(system('fortune -a'), '\n')
  --     call append('$', '        ' . l:line)
  -- endfor

  -- " No modifications to this buffer
  -- setlocal nomodifiable nomodified
  vim.bo.modified = false
  vim.bo.modifiable = false

  --  vim.api.nvim_create_autocmd({ 'BufLeave', 'CursorMoved' }, {
  --   pattern = '*',
  --  callback = function()
  --    vim.wo.cursorline = true
  --   vim.wo.number = true
  --     vim.wo.relativenumber = true
  --      vim.wo.signcolumn = 'yes'
  --     vim.cmd 'enew'
  --    end,
  --   once = true,
  --  })
end

-- " Run after "doing all the startup stuff"
-- autocmd VimEnter * call Start()
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  pattern = '*',
  callback = Start,
})

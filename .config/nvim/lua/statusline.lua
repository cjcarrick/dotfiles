vim.opt.statusline = ''
local function status(append) vim.opt.statusline = vim.opt.statusline + append or '' end

local function hl(group) return '%#' .. group .. '#' end

status(hl 'StatusLine')
status '%f' -- file name
status ' %m' -- file is modified

status(hl 'StatusLineAlt')
-- status '%{FugitiveStatusline()}' -- git branch
status ' %{sy#repo#get_stats_decorated()}' -- git changes

status '%q' -- quickfix list

status '%=' -- begin right alignment

-- Diagnostics
function NumDiagnostics()
  local res = ''

  local errorNum = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  if errorNum > 0 then res = res .. hl 'StatusLineError' .. ' E:' .. tostring(errorNum) end

  local warnNum = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  if warnNum > 0 then res = res .. hl 'StatusLineWarn' .. ' W:' .. tostring(warnNum) end

  local hintNum = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
  if hintNum > 0 then res = res .. hl 'StatusLineHint' .. ' H:' .. tostring(hintNum) end

  local infoNum = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  if infoNum > 0 then res = res .. hl 'StatusLineInfo' .. ' I:' .. tostring(infoNum) end

  return res or ' '
end

-- Update by autocmd instead of luaeval because i think that means it won't have
-- to update as often
vim.api.nvim_create_autocmd({ 'DiagnosticChanged' }, { callback = function() status '' end })

status '%{%luaeval("NumDiagnostics()")%}'

status(hl 'StatusLineAlt')
status ' %y' -- language mode

status(hl 'StatusLine')
status ' %3l:%-2c' -- line:column

status(hl 'StatusLineAlt')
status ' %3p%%' -- % through the file

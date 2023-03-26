vim.o.termguicolors = true

-- Background colors
local bg = {
  -- Primary, used for the main background of neovim
  '#282c34',
  -- Seconday, used for cursorline, etc
  '#2c323d',
  -- Tertiary, used sparingly
  '#3e4452',
  -- Then the blackest
  '#20242b',
}

-- Foreground (text) colors
local fg = {
  -- Primary, used for normal text
  '#abb2bf',
  -- Secondary, used for things like comments and line numbers
  '#5c6370',
  -- Tertiary, used for nontext, etc
  '#373C45',
}

-- Selection colors
local selection = {
  -- Primary, used for visual mode
  '#4f5769',
  -- Secondary, used for other things
  '#3d4351',
}

-- Normal colors
local red = '#e06c75'
local orange = '#e8a15e'
local yellow = '#e5c07b'
local green = '#98c379'
local blue = '#61afef'
local purple = '#c678dd'
local pink = purple
local cyan = '#56b6c2'

local function hi(groups, table)
  for i, group in pairs(groups) do
    vim.api.nvim_set_hl(0, group, table)
  end
end

---@param col1 string
---@param col2 string
---@param factor number
local function mix(col1, col2, factor)
  local red1, green1, blue1 = string.match(col1, '#(%x%x)(%x%x)(%x%x)')
  local red2, green2, blue2 = string.match(col2, '#(%x%x)(%x%x)(%x%x)')
  local red = (tonumber(red1, 16) * factor) + (tonumber(red2, 16) * (1 - factor))
  local green = (tonumber(green1, 16) * factor) + (tonumber(green2, 16) * (1 - factor))
  local blue = (tonumber(blue1, 16) * factor) + (tonumber(blue2, 16) * (1 - factor))
  return '#' .. string.format('%x', red) .. string.format('%x', green) .. string.format('%x', blue)
end

hi({ 'DapUIStepBack', 'DapUIStepOver', 'DapUIStepInto', 'DapUIStepOut' }, { fg = blue })
hi({ 'DapUIWatchesEmpty' }, { link = 'Comment' })
hi({ 'DapUILineNumber' }, { fg = fg[2] })
hi({ 'DapUIWatchesValue', 'DapUIBreakpointsPath', 'DapUIDecoration', 'DapUIScope' }, { fg = fg[1] })
hi({ 'DapUIModifiedValue' }, { fg = fg[1], bold = true })
hi({ 'DapUIWatchesError' }, { fg = red })
hi({ 'DapUIPlayPause', 'DapUIRestart' }, { fg = green })
hi({ 'DapBreakpoint', 'DapUIBreakPointsLine' }, { fg = red })
hi({ 'DapUIStop' }, { fg = red })
hi({ 'DapBreakpointCondition', 'DapUISource' }, { fg = purple })
hi({ 'DapLogPoint' }, { fg = blue })
hi({ 'DapStopped', 'DapUIBreakpointsCurrentLine' }, { fg = orange })

vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DapBreakpointCondition' })
vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DapBreakpointCondition' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped' })

hi({
  'Normal',
  'none',
  '@punctuation.bracket',
}, { fg = fg[1] })

hi({ 'Cursor' }, { fg = bg[1], bg = blue })
hi({ 'CursorColumn' }, { bg = bg[2] })

hi({ 'CursorLine' }, { bg = bg[2], blend = 50 })

hi({ 'LineNr' }, { fg = fg[2] })
hi({ 'CursorLineNr' }, { fg = fg[1] })

hi({ 'LeapLabelPrimary' }, { fg = bg[1], bg = green })
hi({ 'LeapLabelSecondary' }, { fg = bg[1], bg = blue })

hi({ 'GlyphPalette0' }, { fg = red })
hi({ 'GlyphPalette1' }, { fg = orange })
hi({ 'GlyphPalette2' }, { fg = yellow })
hi({ 'GlyphPalette3' }, { fg = green })
hi({ 'GlyphPalette4' }, { fg = blue })
hi({ 'GlyphPalette5' }, { fg = cyan })
hi({ 'GlyphPalette6' }, { fg = purple })
hi({ 'GlyphPalette7' }, { fg = pink })
hi({ 'GlyphPalette8' }, { fg = fg[1] })
hi({ 'GlyphPalette9' }, { fg = fg[2] })

hi({ 'IncSearch', 'Search' }, { fg = bg[1], bg = selection[1] })
hi({ 'Search' }, { fg = bg[1], bg = selection[1] })

hi({ 'ErrorMsg' }, { fg = fg[1] })
hi({ 'ModeMsg' }, { fg = fg[1] })
hi({ 'MoreMsg' }, { fg = fg[1] })
hi({ 'WarningMsg' }, { fg = red })
hi({ 'Question' }, { fg = purple })

hi({ 'Pmenu' }, { fg = fg[1], bg = bg[2] })
hi({ 'PmenuSel' }, { bg = bg[3] })
hi({ 'PmenuSbar' }, { bg = selection[1] })
hi({ 'PmenuThumb' }, { bg = 'fg' })

hi({ 'CmpItemKindSnippet', 'CmpItemKindText' }, { fg = 'fg' })

hi({ 'SpellBad' }, { fg = red })
hi({ 'SpellCap' }, { fg = yellow })
hi({ 'SpellLocal' }, { fg = yellow })
hi({ 'SpellRare' }, { fg = yellow })

hi({ 'StatusLine' }, { fg = fg[1], bg = bg[2] })
hi({ 'StatusLineAlt' }, { fg = fg[2], bg = bg[2] })
hi({ 'StatusLineError' }, { fg = red, bg = bg[2] })
hi({ 'StatusLineWarn' }, { fg = orange, bg = bg[2] })
hi({ 'StatusLineHint' }, { fg = blue, bg = bg[2] })
hi({ 'StatusLineInfo' }, { fg = blue, bg = bg[2] })
hi({ 'StatusLineNC' }, { fg = fg[2], bg = bg[2] })

hi({ 'TabLine' }, { fg = fg[2], bg = bg[2] })
hi({ 'TabLineFill' }, { fg = fg[2], bg = bg[2] })
hi({ 'TabLineSel' }, { fg = bg[2], bg = bg[3] })

hi({ 'Visual' }, { bg = selection[1] })
hi({ 'VisualNOS' }, { bg = selection[1] })

hi({ 'ColorColumn' }, { bg = bg[2] })
hi({ 'Conceal' }, { fg = fg[1] })
hi({ 'Directory' }, { fg = 'fg' })
hi({ 'FernBranchSymbol', 'FernBranchText', 'FernBranch' }, { fg = 'fg' })
hi({ 'VertSplit' }, { fg = bg[2], bg = bg[2] })
hi({ 'Folded' }, { fg = fg[1] })
hi({ 'FoldColumn' }, { bg = fg[0] })
hi({ 'SignColumn' }, { fg = fg[1], bg = bg[0] })

hi({
  'MatchParen',
  'illuminatedWord',
  'illuminatedWordRead',
  'illuminatedWordWrite',
  'illuminatedWordText',
  'illuminatedCurWord',
}, { bg = selection[2] })

hi({ 'SpecialKey' }, { fg = fg[1] })
hi({ 'Title' }, { fg = green })
hi({ 'WildMenu' }, { fg = fg[1] })

hi({ 'preproc', '@preproc' }, { fg = 'fg' })

hi({ 'NonText' }, { fg = bg[1] })
hi({ 'Comment' }, { fg = fg[2], italic = true })
hi({ 'Whitespace' }, { fg = fg[3] })

-- hmtl/xml/css
hi({ 'Tag', '@tag' }, { fg = fg.tag or red })
hi({ '@tag.delimiter' }, { fg = fg[1] })
hi({ '@identifier.id' }, { fg = blue })
hi({ '@identifier.class', '@attribute', '@tag.attribute' }, { fg = orange })
hi({ '@pseudo' }, { fg = cyan })
--

hi({
  '@punctuation.special',
  '@regex',
  'Operator',
  'SpecialChar',
}, { fg = cyan })

hi({ 'PreCondit' }, { fg = yellow })

hi({
  'Character',
  'String',
}, { fg = green })
hi({
  'Number',
  'Boolean',
  'Float',
}, { fg = orange })

hi({
  'Function',
  'CmpItemKindFunction',
  'CmpItemKindMethod',
}, { fg = blue, nocombine = false })

hi({
  'Undefined',
}, { fg = orange })
hi({
  'Parameter',
  '@parameter',
  'Hlargs',
}, { fg = red, italic = true })
hi({
  'Constant',
  '@constant.builtin',
  '@variable.builtin',
}, { fg = yellow })

hi({
  '@namespace',
  '@variable',
  'label',
  'Identifier',
  'typescriptIdentifier',
  'CmpItemKindVariable',
}, { fg = red })
hi({
  'Conditional',
  'Define',
  'Excpetion',
  'Include',
  'Keyword',
  '@type.qualifier',
  'CmpItemKindFunction',
  'Macro',
  'Repeat',
  'Statement',
}, { fg = purple })

hi({
  'Type',
  'DapUIType',
  'StorageClass',
  'Structure',
  'Typedef',
  'Special',
}, { fg = yellow })

hi({ '@unit' }, { fg = red })

-- Diagnostics

hi({ 'Underlined' }, { underline = true })
hi({
  'Debug',
  'Delimiter',
  'Ignore',
  'SpecialComment',
  'Todo',
}, { fg = fg[1] })
hi({
  'DiagnosticError',
  'DiagnosticLineNrError',
  'Error',
}, { fg = red })
hi({
  'DiagnosticWarn',
  'DiagnosticLineNrWarn',
}, { fg = orange })
hi({
  'DiagnosticHint',
  'DiagnosticInfo',
  'DiagnosticLineNrInfo',
  'DiagnosticLineNrHint',
}, { fg = blue, nocombine = false })

hi({ 'DiagnosticUnderlineError' }, { underline = true })
hi({ 'DiagnosticUnderlineInfo' }, { underline = true })
hi({ 'DiagnosticUnderlineWarn' }, { underline = true })

-- Git

hi({ 'FernGitStatusBracket' }, { fg = 'fg' })

local bg = {
  -- Primary, used for the main background of neovim
  '#282c34',
  -- Seconday, used for cursorline, etc
  '#2c323d',
  -- Tertiary, used sparingly
  '#3e4452',
  -- Then the blackest
  '#20242b',
}

hi({ 'SignifySignAdd' }, { bg = bg[1], fg = green })
hi({ 'SignifySignDelete' }, { bg = bg[1], fg = red })
hi({ 'SignifySignChange' }, { bg = bg[1], fg = orange })

hi({ 'DiffAdd', 'diffAdded' }, { bg = mix(green, bg[1], 0.4), ctermfg = 'white' })
hi({ 'DiffChange', 'diffChanged' }, { bg = mix(yellow, bg[1], 0.1), ctermfg = 'white' })
hi({ 'DiffDelete', 'diffRemoved' }, { bg = mix(red, bg[1], 0.4), ctermfg = 'white' })
hi({ 'DiffText', 'diffLine' }, { bg = mix(yellow, bg[1], 0.6), ctermfg = 'white' })

hi({ 'gitcommitComment' }, { fg = fg[2] })
hi({ 'gitcommitUnmerged' }, { fg = red })
hi({ 'gitcommitOnBranch' }, { fg = fg[1] })
hi({ 'gitcommitBranch' }, { fg = purple })
hi({ 'gitcommitDiscardedType' }, { fg = red })
hi({ 'gitcommitSelectedType' }, { fg = green })
hi({ 'gitcommitHeader' }, { fg = fg[1] })
hi({ 'gitcommitUntrackedFile' }, { fg = cyan })
hi({ 'gitcommitDiscardedFile' }, { fg = red })
hi({ 'gitcommitSelectedFile' }, { fg = green })
hi({ 'gitcommitUnmergedFile' }, { fg = yellow })
hi({ 'gitcommitFile' }, { fg = fg[1] })
hi({ 'gitcommitNoBranch' }, { link = 'gitcommitNoBranch' })
hi({ 'gitcommitUntracked', 'FernGitStatusUntracked' }, { fg = orange })
hi({ 'gitcommitDiscarded' }, { link = 'gitcommitDiscarded' })
hi({ 'gitcommitSelected' }, { link = 'gitcommitSelected' })
hi({ 'gitcommitDiscardedArrow' }, { link = 'gitcommitDiscardedArrow' })
hi({ 'gitcommitSelectedArrow' }, { link = 'gitcommitSelectedArrow' })
hi({ 'gitcommitUnmergedArrow' }, { link = 'gitcommitUnmergedArrow' })

hi({ 'TelescopeBorder', 'FloatBorder', 'DapUIFloatBorder', 'LspInfoBorder' }, { fg = fg[3], bg = bg[4] })
hi({ 'TelescopePromptPrefix' }, { fg = blue })
hi({ 'TelescopeSelectionCaret' }, { fg = bg[2], bg = bg[2] })
hi({ 'TelescopePromptTitle', 'TelescopePreviewMessage' }, { fg = fg[1] })
hi({ 'TelescopeNormal', 'NormalFloat' }, { bg = bg[4] })
hi({ 'TelescopeMatching' }, { fg = blue })
hi({ 'TelescopeSelection' }, { bg = bg[2] })
hi({ 'TelescopeMultiIcon' }, { fg = bg[2] })

vim.cmd [[
  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]

vim.g.terminal_color_0 = bg[1]
vim.g.terminal_color_1 = red
vim.g.terminal_color_2 = green
vim.g.terminal_color_3 = yellow
vim.g.terminal_color_4 = blue
vim.g.terminal_color_5 = purple
vim.g.terminal_color_6 = cyan
vim.g.terminal_color_7 = fg[1]
vim.g.terminal_color_8 = bg[3]
vim.g.terminal_color_9 = red
vim.g.terminal_color_10 = green
vim.g.terminal_color_11 = yellow
vim.g.terminal_color_12 = blue
vim.g.terminal_color_13 = purple
vim.g.terminal_color_14 = cyan
vim.g.terminal_color_15 = fg[1]
vim.g.terminal_color_background = bg[1]
vim.g.terminal_color_foreground = fg[1]


-- Background colors
local bg = {
  -- Primary, used for the main background of neovim
  '#2f383e',
  -- Seconday, used for cursorline, etc
  '#344049',
  -- Tertiary, used sparingly
  '#43535d',
  -- Then the blackest
  '#273036',
}

-- Foreground (text) colors
local fg = {
  -- Primary, used for normal text
  '#d3c6aa',
  -- Secondary, used for things like comments and line numbers
  '#b6a580',
  -- Tertiary, used for nontext, etc
  '#2f383e',
}

-- Selection colors
local selection = {
  -- Primary, used for visual mode
  '#495761',
  -- Secondary, used for other things
  '#3c4750',
}

-- Normal colors
local red = '#e67e80'
local orange = '#e29b78'
local yellow = '#dbbc7f'
local green = '#a7c080'
local blue = '#7fbbb3'
local purple = '#d699b6'
local pink = purple
local cyan = '#83c092'

local function hi(groups, table)
  for i, group in pairs(groups) do
    vim.api.nvim_set_hl(0, group, table)
  end
end

hi({
  'Normal',
  'none',
  '@punctuation.bracket',
}, { fg = fg[1]
-- , bg = bg[1] 
})

hi({ 'Cursor' }, { fg = bg[1], bg = blue })
hi({ 'CursorColumn' }, { bg = bg[2] })

hi({ 'CursorLine' }, { bg = bg[2] })

hi({ 'LineNr' }, { fg = fg[2], bg = bg[1] })
hi({ 'CursorLineNr' }, { fg = fg[1], bg = bg[1] })

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
hi({ 'PmenuSel' }, { fg = fg[1], bg = bg[3] })
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
hi({ 'FoldColumn' }, { fg = fg[1] })
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
  'Parameter',
  'Hlargs',
}, { italic = true })
hi({
  'Conditional',
  'Define',
  'Excpetion',
  'Include',
  'Keyword',
  'CmpItemKindFunction',
  'Macro',
  'Repeat',
  'Statement',
}, { fg = purple })

hi({
  'Type',
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

hi({ 'DiffAdd' }, { fg = green })
hi({ 'DiffChange' }, { fg = yellow })
hi({ 'DiffDelete' }, { fg = red })
hi({ 'DiffText' }, { fg = blue })

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

hi({ 'TelescopeBorder', 'FloatBorder' }, { fg = fg[3], bg = bg[4] })
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

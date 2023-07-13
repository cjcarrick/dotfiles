-- enable 16 color

vim.o.t_Co = 16

local bg = 0
local bgBright = 8

local fg = 15
local fgBright = 7

local red = 9
local brightRed = 1

local yellow = 11
local brightYellow = 3

local green = 10
local brightGreen = 2

local blue = 12
local brightBlue = 4

local purple = 13
local pink = 5

local cyan = 14
local orange = 6

local function hi(groups, table)
  for i, group in pairs(groups) do
    if table.ctermfg and table.ctermfg > 7 then
      table.bold = true
      table.ctermfg = table.ctermfg - 8
    end
    -- Disable italics for better portability across terminals
    if table.italic then
      table.italic = false
    end
    vim.api.nvim_set_hl(0, group, table)
  end
end

-- LSP {{
hi({ 'FidgetTask' }, { ctermfg = fgBright })
-- }}

-- Debuggers {{
hi({ 'DapBreakpoint' }, { ctermfg = red })
hi({ 'DapStopped' }, { ctermfg = orange })
hi({ 'DapLogPoint' }, { ctermfg = blue })
-- }}

vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DapBreakpointCondition' })
vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DapBreakpointCondition' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped' })

hi({
  'Normal',
  'NormalFloat',
  'none',
  'cBracket'
}, { ctermfg = fg, ctermbg = 'NONE' })
-- '@punctuation.bracket',

hi({ 'Cursor' }, { ctermfg = bg, ctermbg = blue })
hi({ 'CursorColumn' }, { ctermbg = bgBright })

hi({ 'CursorLine', 'TelescopeSelection' }, { ctermbg = bgBright })

hi({ 'LineNr' }, { ctermfg = fgBright, ctermbg = 'NONE' })
hi({ 'CursorLineNr' }, { ctermfg = fg, ctermbg = 'NONE' })

hi({ 'LeapLabelPrimary' }, { ctermfg = bg, ctermbg = green })
hi({ 'LeapLabelSecondary' }, { ctermfg = bg, ctermbg = blue })

hi({ 'Search', 'IncSearch' }, { ctermbg = brightYellow, ctermfg = fg })

hi({ 'ErrorMsg' }, { ctermfg = fg })
hi({ 'ModeMsg' }, { ctermfg = fg })
hi({ 'MoreMsg' }, { ctermfg = fg })
hi({ 'WarningMsg' }, { ctermfg = red })
hi({ 'Question' }, { ctermfg = purple })

hi({ 'Pmenu' }, { ctermfg = fg, ctermbg = bgBright })
hi({ 'PmenuSel', 'TabLineSel' }, { ctermbg = fgBright, ctermfg = fg })
hi({ 'PmenuSbar' }, { ctermbg = bgBright })
hi({ 'PmenuThumb' }, { ctermbg = fg })

hi({ 'CmpItemKindSnippet', 'CmpItemKindText' }, { ctermfg = fg })

hi({ 'SpellBad' }, { ctermfg = red })
hi({ 'SpellCap' }, { ctermfg = yellow })
hi({ 'SpellLocal' }, { ctermfg = yellow })
hi({ 'SpellRare' }, { ctermfg = yellow })

hi({ 'StatusLine' }, { ctermfg = fg })
hi({ 'StatusLineAlt' }, { ctermfg = fgBright })
hi({ 'StatusLineError' }, { ctermfg = red })
hi({ 'StatusLineWarn' }, { ctermfg = orange })
hi({ 'StatusLineHint' }, { ctermfg = blue })
hi({ 'StatusLineInfo' }, { ctermfg = blue })
hi({ 'StatusLineNC' }, { ctermfg = fgBright })

hi({ 'TabLine' }, { ctermfg = fgBright, ctermbg = bgBright })
hi({ 'TabLineFill' }, { ctermfg = fgBright, ctermbg = bgBright })

hi({ 'Visual' }, { ctermbg = brightBlue })
hi({ 'VisualNOS' }, { ctermbg = brightBlue })

hi({ 'ColorColumn' }, { ctermbg = bgBright })
hi({ 'Conceal' }, { ctermfg = fg })
hi({ 'Directory' }, { ctermfg = fg })
hi({ 'FernBranchSymbol', 'FernBranchText', 'FernBranch' }, { ctermfg = fg })
hi({ 'VertSplit' }, { ctermfg = bgBright })
hi({ 'Folded' }, { ctermfg = fg })
hi({ 'FoldColumn' }, { ctermfg = fg })
hi({ 'SignColumn' }, { ctermfg = fg, ctermbg = 'NONE' })

hi({
  'illuminatedWord',
  'illuminatedWordRead',
  'illuminatedWordWrite',
  'illuminatedWordText',
  'illuminatedCurWord',
}, { ctermbg = bgBright })

hi({ 'MatchParen' }, { ctermbg = fgBright, ctermfg = fg })

hi({ 'SpecialKey' }, { ctermfg = fg })
hi({ 'Title' }, { ctermfg = green })
hi({ 'WildMenu' }, { ctermfg = fg })

hi({ 'preproc', '@preproc' }, { ctermfg = fg })

hi({ 'NonText' }, { ctermfg = bg })
hi({ 'Comment', 'markdownCode' }, { ctermfg = fgBright, italic = true })
hi({ 'Whitespace' }, { ctermfg = bgBright })

-- XML/HTML {{
hi({
  '@tag.delimiter',
  'htmlTag',
  'htmlEndTag',
}, { ctermfg = fg })
-- }}

-- CSS {{
hi({
  'cssProp',
  'cssAttributeSelector',
  'cssSelectorOp',
  'cssBraces',
  'typescriptBraces',
  'typescriptEndColons',
  'cssAttrComma',
}, { ctermfg = fg })
hi({
  'Tag',
  '@tag',
  'htmlTagName',
  'cssTagName',
  'htmlSpecialTagName',
  'sassAmpersand',
}, { ctermfg = red })
hi({
  '@identifier.class',
  'htmlScriptTag',
  'cssClassName',
  'sassClass',
  'sassClassChar',
  'cssClassNameDot',
  'cssColor',
  'cssAttr',
  '@attribute',
  '@tag.attribute',
  'htmlArg',
}, { ctermfg = orange })
hi({
  '@identifier.id',
}, { ctermfg = blue })
hi({
  '@pseudo',
  'cssHacks',
  'cssVendor',
  'cssPseudoClass',
  'cssPseudoClassId',
  'cssCustomProp',
}, { ctermfg = cyan })
-- }}

hi({
  '@punctuation.special',
  '@regex',
  'Operator',
  '@lsp.type.operator',
  'typescriptAssign',
  'typescriptSpecial',
  'typescriptBinaryOp',
  'typescriptUnaryOp',
  'SpecialChar',
}, { ctermfg = cyan })

hi({
  'PreCondit',
}, { ctermfg = yellow })

hi({
  'Character',
  'String',
}, { ctermfg = green })
hi({
  'Number',
  'Boolean',
  'Float',
}, { ctermfg = orange })

hi({
  'Function',
  'typescriptBOMNavigatorProp',
  'typescriptStringMethod',
  'CmpItemKindFunction',
  'sassMixinName',
  '@text.environment',
  'CmpItemKindMethod',
}, { ctermfg = blue, nocombine = false })

hi({
  'Undefined',
}, { ctermfg = orange })
hi({
  'Constant',
  'CmpItemKindConstant',
  '@constant.builtin',
  '@variable.builtin',
}, { ctermfg = yellow })

hi({
  '@namespace',
  '@variable',
  'CmpItemKindEnum',
  'label',
  'Identifier',
  'typescriptIdentifier',
  'typescriptIdentifierName',
  'CmpItemKindVariable',
  'DapUIVariable',
}, { ctermfg = red })
hi({
  'Parameter',
  '@text.environment.name',
  'Hlargs',
  'DapUIModifiedValue',
}, { italic = true })
hi({
  'Conditional',
  'typescriptExport',
  'typescriptTernaryOp',
  'Define',
  'Excpetion',
  'Include',
  'Keyword',
  'CmpItemKindFunction',
  'Macro',
  'Repeat',
  'Statement',
  'luaFunction',
  'sassMixin',
}, { ctermfg = purple })

hi({
  'Type',
  'DapUIType',
  'StorageClass',
  'Structure',
  'Typedef',
  'Special',
}, { ctermfg = yellow })

hi({
  '@unit',
  'cssUnitDecorators',
}, { ctermfg = red })

-- Diagnostics

hi({ 'Underlined' }, { underline = true })
hi({
  'Debug',
  'Delimiter',
  'Ignore',
  'SpecialComment',
  'Todo',
}, { ctermfg = fg })
hi({
  'DiagnosticError',
  'DiagnosticLineNrError',
  'Error',
}, { ctermfg = red })
hi({
  'DiagnosticWarn',
  'DiagnosticLineNrWarn',
}, { ctermfg = orange })
hi({
  'DiagnosticHint',
  'DiagnosticInfo',
  'DiagnosticLineNrInfo',
  'DiagnosticLineNrHint',
}, { ctermfg = blue, nocombine = false })

hi({ 'DiagnosticUnderlineError' }, { underline = true })
hi({ 'DiagnosticUnderlineInfo' }, { underline = true })
hi({ 'DiagnosticUnderlineWarn' }, { underline = true })

hi({ 'FernGitStatusBracket' }, { ctermfg = fg })

hi({ 'SignifySignAdd' }, { ctermbg = bg, ctermfg = green })
hi({ 'SignifySignDelete' }, { ctermbg = bg, ctermfg = red })
hi({ 'SignifySignChange' }, { ctermbg = bg, ctermfg = orange })

hi({ 'DiffAdd', 'diffAdded' }, { ctermbg = brightGreen })
hi({ 'DiffChange', 'diffChanged' }, { ctermbg = brightYellow })
hi({ 'DiffDelete', 'diffRemoved' }, { ctermbg = brightRed })
hi({ 'DiffText', 'diffLine' }, { ctermbg = yellow })

hi({ 'gitcommitComment' }, { ctermfg = fgBright })
hi({ 'gitcommitUnmerged' }, { ctermfg = red })
hi({ 'gitcommitOnBranch' }, { ctermfg = fg })
hi({ 'gitcommitBranch' }, { ctermfg = purple })
hi({ 'gitcommitDiscardedType' }, { ctermfg = red })
hi({ 'gitcommitSelectedType' }, { ctermfg = green })
hi({ 'gitcommitHeader' }, { ctermfg = fg })
hi({ 'gitcommitUntrackedFile' }, { ctermfg = cyan })
hi({ 'gitcommitDiscardedFile' }, { ctermfg = red })
hi({ 'gitcommitSelectedFile' }, { ctermfg = green })
hi({ 'gitcommitUnmergedFile' }, { ctermfg = yellow })
hi({ 'gitcommitFile' }, { ctermfg = fg })
hi({ 'gitcommitNoBranch' }, { link = 'gitcommitNoBranch' })
hi({ 'gitcommitUntracked', 'FernGitStatusUntracked' }, { ctermfg = orange })
hi({ 'gitcommitDiscarded' }, { link = 'gitcommitDiscarded' })
hi({ 'gitcommitSelected' }, { link = 'gitcommitSelected' })
hi({ 'gitcommitDiscardedArrow' }, { link = 'gitcommitDiscardedArrow' })
hi({ 'gitcommitSelectedArrow' }, { link = 'gitcommitSelectedArrow' })
hi({ 'gitcommitUnmergedArrow' }, { link = 'gitcommitUnmergedArrow' })

hi({ 'GlyphPalette0' }, { ctermfg = red })
hi({ 'GlyphPalette1' }, { ctermfg = orange })
hi({ 'GlyphPalette2' }, { ctermfg = yellow })
hi({ 'GlyphPalette3' }, { ctermfg = green })
hi({ 'GlyphPalette4' }, { ctermfg = blue })
hi({ 'GlyphPalette5' }, { ctermfg = cyan })
hi({ 'GlyphPalette6' }, { ctermfg = purple })
hi({ 'GlyphPalette7' }, { ctermfg = pink })
hi({ 'GlyphPalette8' }, { ctermfg = fg })
hi({ 'GlyphPalette9' }, { ctermfg = fgBright })

hi({ 'TelescopeBorder', 'LspInfoBorder', 'FloatBorder', 'DapUIFloatBorder' }, { ctermfg = bgBright })
-- hi({ 'TelescopePromptPrefix' }, { ctermfg = blue })
hi({ 'TelescopeSelectionCaret' }, { ctermfg = bgBright, ctermbg = bgBright })
hi(
  { 'TelescopePromptTitle', 'TelescopePreviewTitle', 'TelescopePreviewMessage', 'TelescopePromptCounter' },
  { ctermfg = fgBright }
)

hi({ 'TelescopeNormal' }, { ctermbg = bg, ctermfg = fgBright })
hi({ 'TelescopeMatching' }, { ctermfg = fg })
-- hi({ 'TelescopeMultiIcon' }, { ctermfg = bgBright })

--vim.cmd [[
--sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
--sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
--sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
--sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
--]]

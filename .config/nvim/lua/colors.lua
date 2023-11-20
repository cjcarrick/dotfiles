-- enable 16 color
-- vim.o.t_Co = 16

local bg = 0
local bgBright = 15

local fg = 7
local fgBright = 8

local red = 1
local brightRed = 9

local yellow = 3
local brightYellow = 11

local green = 2
local brightGreen = 10

local blue = 4
local brightBlue = 12

local purple = 5
local pink = 13

local cyan = 6
local orange = 14

local function hi(groups, table)
  for _, group in pairs(groups) do
    vim.api.nvim_set_hl(0, group, table)
  end
end

hi({ 'Normal', 'NormalFloat', 'none', 'cBracket' }, { ctermfg = fg, ctermbg = 'NONE' })

hi({ 'Cursor' }, { ctermfg = bg, ctermbg = blue })
hi({ 'CursorColumn' }, { ctermbg = bgBright })

hi({ 'CursorLine', 'TelescopeSelection' }, { ctermbg = bgBright })

hi({ 'LineNr' }, { ctermfg = fgBright, ctermbg = 'NONE' })
hi({ 'CursorLineNr' }, { ctermfg = fg, ctermbg = 'NONE' })

hi({ 'LspSignatureActiveParameter' }, { ctermbg = brightBlue })
hi({ 'Search', 'IncSearch' }, { ctermbg = brightYellow, ctermfg = fg })

hi({ 'FloatBorder' }, { ctermfg = bgBright })

hi({ 'ErrorMsg', 'ModeMsg', 'MoreMsg' }, { link = 'Normal' })

hi({ 'WarningMsg' }, { ctermfg = red })
hi({ 'Question' }, { ctermfg = purple })

hi({ 'Pmenu' }, { ctermfg = fg, ctermbg = bgBright })
hi({ 'PmenuSel', 'TabLineSel' }, { ctermbg = fgBright, ctermfg = fg })
hi({ 'PmenuSbar' }, { ctermbg = bgBright })
hi({ 'PmenuThumb' }, { ctermbg = fg })

hi({ 'SpellBad' }, { ctermfg = red })
hi({ 'SpellCap', 'SpellLocal', 'SpellRare' }, { ctermfg = yellow })

hi({ 'StatusLine' }, { ctermfg = fg })
hi({ 'StatusLineAlt' }, { ctermfg = fgBright })
hi({ 'StatusLineError' }, { ctermfg = red })
hi({ 'StatusLineWarn' }, { ctermfg = orange })
hi({ 'StatusLineHint', 'StatusLineInfo' }, { ctermfg = blue })
hi({ 'StatusLineNC' }, { ctermfg = fgBright })

hi({ 'TabLine' }, { ctermfg = fgBright, ctermbg = bgBright })
hi({ 'TabLineFill' }, { ctermfg = fgBright, ctermbg = bgBright })

hi({ 'Visual' }, { ctermbg = brightBlue })
hi({ 'VisualNOS' }, { ctermbg = brightBlue })

hi({ 'ColorColumn' }, { ctermbg = bgBright })
hi({ 'Conceal' }, { ctermfg = fg })
hi({ 'Directory' }, { ctermfg = fg })
hi({ 'VertSplit' }, { ctermfg = bgBright })
hi({ 'Folded' }, { ctermfg = fg })
hi({ 'FoldColumn' }, { ctermfg = fg })
hi({ 'SignColumn' }, { ctermfg = fg, ctermbg = 'NONE' })

hi({ 'MatchParen' }, { ctermbg = fgBright, ctermfg = fg })

hi({ 'SpecialKey' }, { ctermfg = fg })
hi({ 'Title' }, { ctermfg = green })
hi({ 'WildMenu' }, { ctermfg = fg })

hi({ 'preproc' }, { ctermfg = fg })

hi({ 'NonText' }, { ctermfg = bg })
hi({ 'Comment' }, { ctermfg = fgBright, italic = true })
hi({ 'Whitespace' }, { ctermfg = bgBright })

hi({ 'Operator', 'SpecialChar' }, { ctermfg = cyan })

hi({ 'PreCondit' }, { ctermfg = yellow })

hi({ 'Character', 'String' }, { ctermfg = green })

hi({ 'Number', 'Boolean', 'Float' }, { ctermfg = orange })

hi({ 'Undefined' }, { ctermfg = orange })

hi({ 'Function' }, { ctermfg = blue, nocombine = false })

hi({ 'Constant' }, { ctermfg = yellow })

hi({ 'label', 'Identifier', 'Tag' }, { ctermfg = red })

hi({ 'Parameter', 'Hlargs' }, { italic = true })

hi({ 'Underlined' }, { underline = true })

hi({
  'Conditional',
  'Define',
  'Excpetion',
  'Include',
  'Keyword',
  'Macro',
  'Repeat',
  'Statement',
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

hi({ 'DiffAdd', 'diffAdded' }, { ctermbg = brightGreen })
hi({ 'DiffChange', 'diffChanged' }, { ctermbg = 'NONE' })
hi({ 'DiffDelete', 'diffRemoved' }, { ctermbg = brightRed })
hi({ 'DiffText', 'diffLine' }, { ctermbg = brightYellow })

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
hi({ 'gitcommitUntracked' }, { ctermfg = orange })
hi({ 'gitcommitDiscarded' }, { link = 'gitcommitDiscarded' })
hi({ 'gitcommitSelected' }, { link = 'gitcommitSelected' })
hi({ 'gitcommitDiscardedArrow' }, { link = 'gitcommitDiscardedArrow' })
hi({ 'gitcommitSelectedArrow' }, { link = 'gitcommitSelectedArrow' })
hi({ 'gitcommitUnmergedArrow' }, { link = 'gitcommitUnmergedArrow' })

vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DapBreakpointCondition' })
vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DapBreakpointCondition' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped' })

-- CSS {{
hi({
  'cssAttrComma',
  'cssAttributeSelector',
  'cssBraces',
  'cssProp',
  'cssSelectorOp',
}, { link = 'Delimiter' })
hi({
  'sassMixinName',
}, { link = 'Function' })
hi({
  'sassMixin',
  'sassMedia',
  'cssAtKeyword',
  'sassMixing',
}, { link = 'Keyword' })
hi({
  'cssTagName',
  'sassAmpersand',
}, { link = 'Tag' })
hi({
  'cssUnitDecorators',
  '@unit',
}, { ctermfg = red })
hi({
  'cssAttr',
  'cssClassName',
  'cssClassNameDot',
  '@identifier.class.scss',
  'cssColor',
  'sassClass',
  'sassClassChar',
}, { ctermfg = orange })
hi({
  'cssCustomProp',
  'cssHacks',
  'cssPseudoClass',
  'pseudo',
  '@pseudo',
  'cssPseudoClassId',
  'cssVendor',
}, { ctermfg = cyan })
hi({
  '@attribute.scss',
}, { ctermfg = orange })
-- }}

-- Lua {{
hi({
  'luaFunction',
}, { link = 'Keyword' })
-- }}

-- Typescript {{
hi({
  'typescriptBraces',
  'typescriptEndColons',
}, { link = 'Delimiter' })
hi({
  '@punctuation.delimiter.typescript',
}, { ctermfg = 'NONE', ctermbg = 'NONE' })
hi({
  'typescriptBOMNavigatorProp',
  'typescriptStringMethod',
}, { link = 'Function' })
hi({
  'typescriptIdentifier',
  'typescriptIdentifierName',
}, { link = 'Identifier' })
hi({
  'typescriptExport',
  'typescriptTernaryOp',
}, { link = 'Keyword' })
hi({
  'typescriptAssign',
  'typescriptSpecial',
  'typescriptBinaryOp',
  'typescriptUnaryOp',
}, { link = 'Operator' })
hi({
  '@variable.builtin.typescript',
}, { link = 'Constant' })
-- }}

-- Markdown {{
hi({
  'markdownH3Delimiter',
  'markdownH4Delimiter',
  'markdownH5Delimiter',
  'markdownH6Delimiter',
}, { ctermbg = 'NONE', link = 'markdownH3' })
hi({
  'markdownH1',
  'markdownH1Delimiter',
}, { ctermfg = blue })
hi({
  'markdownH2',
  'markdownH2Delimiter',
}, { ctermfg = red })
hi({
  'markdownCode',
}, { ctermfg = fgBright, italic = true })
hi({
  'markdownListMarker',
}, { link = 'Normal' })
-- }}

-- XML/HTML {{
hi({
  'htmlTag',
  'htmlEndTag',
  '@text.title.html',
}, { ctermfg = fg })
hi({
  'htmlTagName',
  'htmlSpecialTagName',
  '@preproc.xml',
}, { link = 'Tag' })
hi({
  '@number.xml',
  '@boolean.xml',
}, { link = 'String' })
hi({
  'htmlArg',
}, { ctermfg = orange })
hi({
  '@tag.delimiter',
}, { link = 'Delimiter' })
hi({
  '@tag.attribute',
}, { ctermfg = orange })
-- }}

-- LSP {{
hi({
  'FidgetTask',
}, { ctermfg = fgBright })
hi({
  'LspInfoBorder',
}, { link = 'FloatBorder' })
-- }}

-- Debuggers {{
hi({
  'DapUIModifiedValue',
}, { italic = true })
hi({
  'DapBreakpoint',
}, { ctermfg = red })
hi({
  'DapStopped',
}, { ctermfg = orange })
hi({
  'DapLogPoint',
}, { ctermfg = blue })
hi({
  'DapUIFloatBorder',
}, { link = 'FloatBorder' })
hi({
  'DapUIVariable',
}, { link = 'Identifier' })
-- }}

-- Telescope {{
hi({
  'TelescopeNormal',
}, { ctermbg = bg, ctermfg = fgBright })
hi({
  'TelescopeMatching',
}, { ctermfg = fg })
hi({
  'TelescopeBorder',
}, { link = 'FloatBorder' })
hi({
  'TelescopePromptTitle',
  'TelescopePreviewTitle',
  'TelescopePreviewMessage',
  'TelescopePromptCounter',
}, { ctermfg = fgBright })
hi({
  'TelescopeSelectionCaret',
}, { ctermfg = bgBright, ctermbg = bgBright })
-- }}

-- CMP {{
hi({
  'CmpItemKindSnippet',
  'CmpItemKindText',
}, { ctermfg = fg })
hi({
  'CmpItemKindFunction',
  'CmpItemKindMethod',
}, { link = 'Function' })
hi({
  'CmpItemKindConstant',
}, { link = 'Constant' })
hi({
  'CmpItemKindEnum',
  'CmpItemKindEnumMember',
  'CmpItemKindVariable',
}, { link = 'Identifier' })
-- }}

-- Illuminate {{
hi({
  'illuminatedWord',
  'illuminatedWordRead',
  'illuminatedWordWrite',
  'illuminatedWordText',
  'illuminatedCurWord',
}, { ctermbg = bgBright })
-- }}

-- Leap {{
hi({ 'LeapLabelPrimary' }, { ctermfg = bg, ctermbg = green })
hi({ 'LeapLabelSecondary' }, { ctermfg = bg, ctermbg = blue })
-- }}

-- Signify {{
hi({ 'SignifySignAdd' }, { ctermbg = bg, ctermfg = green })
hi({ 'SignifySignDelete' }, { ctermbg = bg, ctermfg = red })
hi({ 'SignifySignChange' }, { ctermbg = bg, ctermfg = orange })
-- }}

-- Glyph Palette {{
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
-- }}

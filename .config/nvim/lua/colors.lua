-- enable 16 color
-- vim.o.t_Co = 16

vim.o.termguicolors = true
---@type { color: { gui : string, cterm : number } }
local colors = {
  black      = { gui = '#202020', cterm = 0  }, -- popups, etc. use sparingly
  darkGray   = { gui = '#282828', cterm = 0  }, -- normal background
  gray       = { gui = '#3f3f3f', cterm = 7  }, -- cursorline, etc
  brightGray = { gui = '#606060', cterm = 15 }, -- comments, etc
  white      = { gui = '#ebdbb2', cterm = 7  }, -- main text colors

  red    = { gui = '#c15550', cterm = 1  },
  orange = { gui = '#cf813c', cterm = 14 },
  yellow = { gui = '#dead2a', cterm = 3  },
  green  = { gui = '#98971a', cterm = 2  },
  blue   = { gui = '#458588', cterm = 4  },
  cyan   = { gui = '#689d6a', cterm = 6  },
  purple = { gui = '#b85b96', cterm = 5  },
  pink   = { gui = '#b85b96', cterm = 13  },

  brightYellow = { gui = '#605222', cterm = 11 },
  brightRed    = { gui = '#743e3c', cterm = 9 },
  brightGreen  = { gui = '#40451d', cterm = 10 },
  brightBlue   = { gui = '#365658', cterm = 12 },

  NONE = { gui = 'NONE', cterm = 'NONE' }
}

local function hi(groups, table)
  for _, group in pairs(groups) do
      vim.api.nvim_set_hl(0, group, {
        ctermfg = table.fg and table.fg.cterm or nil,
        ctermbg = table.bg and table.bg.cterm or nil,
        fg = table.fg and table.fg.gui or nil,
        bg = table.bg and table.bg.gui or nil,
        italic = table.italic,
        link = table.link
      })
  end
end

hi({ 'Normal', 'none', 'cBracket' }, { fg = colors.white, bg = colors.darkGray})
hi({ 'NormalFloat' }, { fg = colors.white, bg = colors.black})
hi({ 'FloatBorder' }, { bg = colors.black, fg = colors.black })

hi({ 'Cursor' }, { fg = colors.brightGray, bg = colors.blue })
hi({ 'CursorColumn' }, { bg = colors.gray })

hi({ 'CursorLine', 'TelescopeSelection' }, { bg = { gui = '#353535', cterm = 7  }})

hi({ 'LineNr' }, { fg = colors.brightGray, bg = colors.darkGray })
hi({ 'CursorLineNr' }, { fg = colors.white, bg = 'NONE' })
hi({ 'CursorLineSign', 'CursorLineNr' }, { bg = colors.darkGray})

hi({ 'LspSignatureActiveParameter' }, { bg = colors.brightBlue })
hi({ 'Search', 'IncSearch' }, { bg = colors.brightYellow, fg = colors.white })

hi({ 'ErrorMsg', 'ModeMsg', 'MoreMsg' }, { link = 'Normal' })

hi({ 'WarningMsg' }, { fg = colors.red })
hi({ 'Question' }, { fg = colors.purple })

hi({ 'Pmenu' }, { fg = colors.white, bg = colors.black })
hi({ 'PmenuSel', 'TabLineSel' }, { bg = colors.gray })
hi({ 'PmenuSbar' }, { bg = colors.gray })
hi({ 'PmenuThumb' }, { bg = colors.white })

hi({ 'SpellBad' }, { fg = colors.red })
hi({ 'SpellCap', 'SpellLocal', 'SpellRare' }, { fg = colors.yellow })

hi({ 'StatusLine', 'MsgArea' }, { fg = colors.white, bg = colors.darkGray })
hi({ 'StatusLineAlt' }, { fg = colors.brightGray, bg = colors.darkGray })
hi({ 'StatusLineError' }, { fg = colors.red, bg = colors.darkGray  })
hi({ 'StatusLineWarn' }, { fg = colors.orange, bg = colors.darkGray  })
hi({ 'StatusLineHint', 'StatusLineInfo' }, { fg = colors.blue , bg = colors.darkGray  })
hi({ 'StatusLineNC' }, { fg = colors.white , bg = colors.darkGray  })

hi({ 'TabLine' }, { fg = colors.white, bg = colors.gray })
hi({ 'TabLineFill' }, { fg = colors.white, bg = colors.gray })

hi({ 'Visual' }, { bg = colors.brightBlue })
hi({ 'VisualNOS' }, { bg = colors.brightBlue })

hi({ 'ColorColumn' }, { bg = colors.gray })
hi({ 'Conceal' }, { fg = colors.white })
hi({ 'Directory' }, { fg = colors.white })
hi({ 'VertSplit' }, { fg = colors.gray })
hi({ 'Folded' }, { fg = colors.white })
hi({ 'FoldColumn' }, { fg = colors.white })
hi({ 'SignColumn' }, { fg = colors.white, bg = colors.darkGray })

hi({ 'MatchParen' }, { bg = colors.brightGray })

hi({ 'SpecialKey' }, { fg = colors.white })
hi({ 'Title' }, { fg = colors.green })
hi({ 'WildMenu' }, { fg = colors.white })

hi({ 'preproc' }, { fg = colors.white })

hi({ 'NonText' }, { fg = colors.brightGray })
hi({ 'Comment' }, { fg = colors.brightGray, italic = true })
hi({ 'Whitespace' }, { fg = colors.gray })

hi({ 'Operator', 'SpecialChar' }, { fg = colors.cyan })

hi({ 'PreCondit' }, { fg = colors.yellow })

hi({ 'Character', 'String' }, { fg = colors.green })

hi({ 'Number', 'Boolean', 'Float' }, { fg = colors.orange })

hi({ 'Undefined' }, { fg = colors.orange })

hi({ 'Function' }, { fg = colors.blue, nocombine = false })

hi({ 'Constant' }, { fg = colors.yellow })

hi({ 'label', 'Identifier', 'Tag' }, { fg = colors.red })

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
}, { fg = colors.purple })

hi({
  'Type',
  'DapUIType',
  'StorageClass',
  'Structure',
  'Typedef',
  'Special',
}, { fg = colors.yellow })

hi({
  'Debug',
  'Delimiter',
  'Ignore',
  'SpecialComment',
  'Todo',
}, { fg = colors.white })

hi({
  'DiagnosticError',
  'DiagnosticLineNrError',
  'Error',
}, { fg = colors.red })

hi({
  'DiagnosticWarn',
  'DiagnosticLineNrWarn',
}, { fg = colors.orange })

hi({
  'DiagnosticHint',
  'DiagnosticInfo',
  'DiagnosticLineNrInfo',
  'DiagnosticLineNrHint',
}, { fg = colors.blue, nocombine = false })

hi({ 'DiagnosticUnderlineError' }, { underline = true })
hi({ 'DiagnosticUnderlineInfo' }, { underline = true })
hi({ 'DiagnosticUnderlineWarn' }, { underline = true })

hi({ 'DiffAdd', 'diffAdded' }, { bg = colors.brightGreen })
hi({ 'DiffChange', 'diffChanged' }, { bg = 'NONE' })
hi({ 'DiffDelete', 'diffRemoved' }, { bg = colors.brightRed })
hi({ 'DiffText', 'diffLine' }, { bg = colors.brightYellow })

hi({ 'gitcommitComment' }, { fg = colors.white })
hi({ 'gitcommitUnmerged' }, { fg = colors.red })
hi({ 'gitcommitOnBranch' }, { fg = colors.brightGray })
hi({ 'gitcommitBranch' }, { fg = colors.purple })
hi({ 'gitcommitDiscardedType' }, { fg = colors.red })
hi({ 'gitcommitSelectedType' }, { fg =colors.brightYellow})
hi({ 'gitcommitHeader' }, { fg = colors.brightGray })
hi({ 'gitcommitUntrackedFile' }, { fg = colors.cyan })
hi({ 'gitcommitDiscardedFile' }, { fg = colors.red })
hi({ 'gitcommitSelectedFile' }, { fg = colors.green })
hi({ 'gitcommitUnmergedFile' }, { fg = colors.yellow })
hi({ 'gitcommitFile' }, { fg = colors.brightGray })
hi({ 'gitcommitNoBranch' }, { link = 'gitcommitNoBranch' })
hi({ 'gitcommitUntracked' }, { fg = colors.orange })
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
}, { fg = colors.red })
hi({
  'cssAttr',
  'cssClassName',
  'cssClassNameDot',
  '@identifier.class.scss',
  'cssColor',
  'sassClass',
  'sassClassChar',
}, { fg = colors.orange })
hi({
  'cssCustomProp',
  'cssHacks',
  'cssPseudoClass',
  'pseudo',
  '@pseudo',
  'cssPseudoClassId',
  'cssVendor',
}, { fg = colors.cyan })
hi({
  '@attribute.scss',
}, { fg = colors.orange })
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
}, { fg = 'NONE', bg = 'NONE' })
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
}, { bg = 'NONE', link = 'markdownH3' })
hi({
  'markdownH1',
  'markdownH1Delimiter',
}, { fg = colors.blue })
hi({
  'markdownH2',
  'markdownH2Delimiter',
}, { fg = colors.red })
hi({
  'markdownCode',
}, { fg = colors.white, italic = true })
hi({
  'markdownListMarker',
}, { link = 'Normal' })
-- }}

-- XML/HTML {{
hi({
  'htmlTag',
  'htmlEndTag',
  '@text.title.html',
}, { fg = colors.brightGray })
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
}, { fg = colors.orange })
hi({
  '@tag.delimiter',
}, { link = 'Delimiter' })
hi({
  '@tag.attribute',
}, { fg = colors.orange })
-- }}

-- LSP {{
hi({
  'FidgetTask',
}, { fg = colors.white })
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
}, { fg = colors.red })
hi({
  'DapStopped',
}, { fg = colors.orange })
hi({
  'DapLogPoint',
}, { fg = colors.blue })
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
}, { fg = colors.brightGray })
hi({
  'TelescopeMatching',
}, { fg = colors.white })
hi({
  'TelescopeBorder',
}, { fg = colors.brightGray })
hi({
  'TelescopePromptTitle',
  'TelescopePreviewTitle',
  'TelescopePreviewMessage',
  'TelescopePromptCounter',
}, { fg = colors.brightGray })
hi({
  'TelescopeSelectionCaret',
}, { bg ={ gui = '#353535', cterm = 7  } })
-- }}

-- CMP {{
hi({
  'CmpItemKindSnippet',
  'CmpItemKindText',
}, { fg = colors.white })
hi({
  'CmpItemKindFunction',
  'CmpItemKindMethod',
}, { fg = colors.blue })
hi({
  'CmpItemKindConstant',
}, { link = 'Constant' })
hi({
  'CmpItemKindEnum',
  'CmpItemKindEnumMember',
  'CmpItemKindVariable',
}, { fg = colors.red })
hi({
  'CmpItemKindKeyword',
}, { fg = colors.purple })

hi({'CmpItemAbbr'}, { fg = colors.brightGray })
hi({'CmpItemAbbrMatch'}, { fg = colors.white })
-- }}

-- Illuminate {{
hi({
  'illuminatedWord',
  'illuminatedWordRead',
  'illuminatedWordWrite',
  'illuminatedWordText',
  'illuminatedCurWord',
}, { bg = colors.gray })
-- }}

-- Leap {{
hi({ 'LeapLabelPrimary' }, { fg = colors.brightGray, bg = colors.green })
hi({ 'LeapLabelSecondary' }, { fg = colors.brightGray, bg = colors.blue })
-- }}

-- Signify {{
hi({ 'SignifySignAdd' }, { bg = colors.brightGreen, fg = colors.green })
hi({ 'SignifySignDelete' }, { bg = colors.brightRed, fg = colors.red })
hi({ 'SignifySignChange' }, { bg = colors.brightYellow, fg = colors.orange })
-- }}

-- Glyph Palette {{
hi({ 'GlyphPalette0' }, { fg = colors.red })
hi({ 'GlyphPalette1' }, { fg = colors.orange })
hi({ 'GlyphPalette2' }, { fg = colors.yellow })
hi({ 'GlyphPalette3' }, { fg = colors.green })
hi({ 'GlyphPalette4' }, { fg = colors.blue })
hi({ 'GlyphPalette5' }, { fg = colors.cyan })
hi({ 'GlyphPalette6' }, { fg = colors.purple })
hi({ 'GlyphPalette7' }, { fg = colors.pink })
hi({ 'GlyphPalette8' }, { fg = colors.brightGray })
hi({ 'GlyphPalette9' }, { fg = colors.white })
-- }}

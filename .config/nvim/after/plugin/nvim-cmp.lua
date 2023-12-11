local ok, cmp = pcall(require, 'cmp')
if not ok then return end

local kind_icons = {
  Class = ' ',
  Color = ' ',
  Constant = ' ',
  Constructor = ' ',
  Enum = ' ',
  EnumMember = ' ',
  Field = ' ',
  File = ' ',
  Folder = ' ',
  Function = ' ',
  Interface = ' ',
  Keyword = ' ',
  Method = ' ',
  Reference = ' ',
  Module = ' ',
  Property = ' ',
  Snippet = ' ',
  Struct = ' ',
  Text = ' ',
  Unit = ' ',
  Value = ' ',
  Variable = ' ',
}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end

vim.o.pumheight = 8

cmp.setup {

  enabled = function()
    local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
    if buftype == 'prompt' then
      return false
      -- disable in telescope
      -- elseif snippy.is_active() then
      --   return false
      -- disable in snippets
    elseif
        require('cmp.config.context').in_treesitter_capture 'comment' == true
        or require('cmp.config.context').in_syntax_group 'Comment'
    then
      return false
      -- disable in comments
    else
      return true
    end
  end,

  snippet = {
    expand = function(args)
      local ok, ls = pcall(require, 'luasnip')
      if ok then ls.lsp_expand(args.body) end
    end,
  },

  window = {
    documentation = {
      side_padding = 2,
      border = { "", "", "", "│", "", "", "", "│" }
    }
  },


  formatting = {
    format = function(_, vim_item)
      -- vim_item.kind = (kind_icons[vim_item.kind] or vim_item.kind)
      -- prevent menus from being really wide, and try to keep them fixed width
      -- (https://github.com/hrsh7th/nvim-cmp/discussions/609#discussioncomment-3395522)
      local MAX_LABEL_WIDTH = 40
      MAX_LABEL_WIDTH = MAX_LABEL_WIDTH - #vim_item.kind
      if #vim_item.word > MAX_LABEL_WIDTH - 2 then
        vim_item.abbr = vim_item.word:sub(0, MAX_LABEL_WIDTH - 2) .. '… '
      else
        vim_item.abbr = vim_item.word .. (' '):rep(MAX_LABEL_WIDTH - #vim_item.word)
      end
      -- vim_item.kind = (' '):rep(MAX_LABEL_WIDTH - #vim_item.abbr) .. vim_item.kind
      return vim_item
    end,
  },

    view = {
      docs = {
        auto_open = false
      }
    },

  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    ['<C-g>'] = function()
      if cmp.visible_docs() then
        cmp.close_docs()
      else
        cmp.open_docs()
      end
    end,

    ['<C-Space>'] = cmp.mapping(function()
      print 'hello'
      cmp.complete { reason = cmp.ContextReason.Auto }
    end, { 'i', 's' }),

    ['<CR>'] = function(fallback)
      if
          not cmp.get_selected_entry() --[[ or cmp.get_selected_entry().source.name == 'nvim_lsp_signature_help' ]]
      then
        fallback()
      else
        cmp.confirm {
          -- Replace word if completing in the middle of a word
          -- https://github.com/hrsh7th/nvim-cmp/issues/664
          behavior = cmp.ConfirmBehavior.Replace,
          -- Don't select first item on CR if nothing was selected
          select = true,
        }
      end
    end,

    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  },

  completion = {
    completeopt = 'menu,menuone,noinsert',
    autocomplete = {
      cmp.TriggerEvent.TextChanged,
      cmp.TriggerEvent.InsertEnter,
    },
  },

  sources = {
    -- { name = 'nvim_lsp_signature_help' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'nvim_lsp', keyword_length = 0 },
  },
}

cmp.setup.filetype('tex', {
  sources = {
    { name = 'luasnip' },
    { name = 'buffer', keyword_length = 4 },
    { name = 'nvim_lsp', keyword_length = 0 },
  }
})


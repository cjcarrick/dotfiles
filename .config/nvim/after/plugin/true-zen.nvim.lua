if not pcall(require, 'true-zen') then return end

local colors = require("true-zen.utils.colors")
local cnf = require("true-zen.config").options
local data = require("true-zen.utils.data")
local IGNORED_BUF_TYPES = data.set_of(cnf.modes.minimalist.ignored_buf_types)


vim.keymap.set('n', '<leader>z', ':TZMinimalist <cr>', { silent = true })

local override_opts = {
  number = false,
  relativenumber = false,
  showtabline = 0,
  signcolumn = 'no',
  statusline = '',
  cmdheight = 0,
  laststatus = 0,
  showcmd = false,
  showmode = false,
  ruler = false,
  numberwidth = 1
}

local original_opts = {}

local function save_opts()
  -- check if current window's buffer type matches any of IGNORED_BUF_TYPES, if so look for one that doesn't
  local suitable_window = vim.fn.winnr()
  local currtab = vim.fn.tabpagenr()
  if IGNORED_BUF_TYPES[vim.fn.gettabwinvar(currtab, suitable_window, "&buftype")] ~= nil then
    for i = 1, vim.fn.winnr("$") do
      if IGNORED_BUF_TYPES[vim.fn.gettabwinvar(currtab, i, "&buftype")] == nil then
        suitable_window = i
        goto continue
      end
    end
  end
  ::continue::

  -- get the options from suitable_window
  for user_opt, val in pairs(override_opts) do
    local opt = vim.fn.gettabwinvar(currtab, suitable_window, "&" .. user_opt)
    original_opts[user_opt] = (type(opt) == "number" and (opt == 1 and true or false) or opt)
    vim.o[user_opt] = val
  end

  original_opts.highlights = {
    StatusLine = colors.get_hl("StatusLine"),
    StatusLineNC = colors.get_hl("StatusLineNC"),
    TabLine = colors.get_hl("TabLine"),
    TabLineFill = colors.get_hl("TabLineFill"),
  }

  print('saved')
end

local function restore_opts()
  if original_opts.number == true then
    vim.cmd 'set number'
  end

  if original_opts.relativenumber == true then
    vim.cmd 'set relativenumber'
  end

  original_opts.number = nil
  original_opts.relativenumber = nil

  for k, v in pairs(original_opts) do
    if k ~= "highlights" then
      vim.o[k] = v
    end
  end

  for hi_group, props in pairs(original_opts["highlights"]) do
    colors.highlight(hi_group, { fg = props.foreground, bg = props.background }, true)
  end

  print 'restored'
end

require('true-zen').setup {
  modes = {
    ataraxis = {
      backdrop = 0,
      minimum_writing_area = {
        width = 70,
        height = 44,
      },
      quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
      padding = {
        -- padding windows
        left = 52,
        right = 52,
        top = 0,
        bottom = 0,
      },

      callbacks = {
        -- run functions when opening/closing Ataraxis mode
        open_pre = function ()
          print('bbbbb')
        end,

        open_pos = function()
          print('aaaaaaaaa')
          save_opts()
        end,

        close_pre = function() restore_opts() end,
        close_pos = nil,
      },
    },

    minimalist = {
      ignored_buf_types = { 'nofile' },
      options = {
        -- options to be disabled when entering Minimalist mode
        number = false,
        relativenumber = false,
        showtabline = 0,
        signcolumn = 'no',
        statusline = '',
        cmdheight = 0,
        laststatus = 0,
        showcmd = false,
        showmode = false,
        ruler = false,
        numberwidth = 1,
      },
      callbacks = {
        -- run functions when opening/closing Minimalist mode
        open_pre = function()
          print('cccc')
          -- if os.getenv 'TMUX' then os.execute 'tmux set -g status off \\; resize-pane -Z' end
        end,
        open_pos = nil,
        close_pre = function()
          -- if os.getenv 'TMUX' then os.execute 'tmux set -g status on \\; resize-pane -Z' end
        end,
        close_pos = nil,
      },
    },
  },
}

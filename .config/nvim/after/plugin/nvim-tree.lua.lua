local lib = require 'nvim-tree.lib'
local view = require 'nvim-tree.view'
local api = require 'nvim-tree.api'

vim.g.nvim_tree_disable_default_bindings = 1

vim.keymap.set('n', '<leader>j', function()
  if vim.g.nvim_tree_is_visible then
    require('nvim-tree.api').tree.focus()
  else
    require('nvim-tree.api').tree.toggle(true)
  end
end)


local function edit_or_open()
  -- open as vsplit on current node
  local action = 'edit'
  local node = lib.get_node_at_cursor()

  -- Just copy what's done normally with vsplit
  if node.link_to and not node.nodes then
    require('nvim-tree.actions.node').open.edit { close = false }
  elseif node.nodes ~= nil then
    lib.expand_or_collapse(node)
    vim.api.nvim_feedkeys('j', 'n', false)
  else
    require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
    view.close() -- Close the tree if file was opened
  end
end

local function vsplit_preview()
  -- open as vsplit on current node
  local action = 'vsplit'
  local node = lib.get_node_at_cursor()

  -- Just copy what's done normally with vsplit
  if node.link_to and not node.nodes then
    require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
  elseif node.nodes ~= nil then
    lib.expand_or_collapse(node)
  else
    require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
  end

  -- Finally refocus on tree if it was lost
  view.focus()
end

local git_add = function()
  local node = lib.get_node_at_cursor()
  local gs = node.git_status.file

  -- If the file is untracked, unstaged or partially staged, we stage it
  if gs == '??' or gs == 'MM' or gs == 'AM' or gs == ' M' then
    vim.cmd('silent !git add ' .. node.absolute_path)

    -- If the file is staged, we unstage
  elseif gs == 'M ' or gs == 'A ' then
    vim.cmd('silent !git restore --staged ' .. node.absolute_path)
  end

  lib.refresh_tree()
end

require('nvim-tree').setup {
  sort_by = 'case_sensitive',
  view = {
    hide_root_folder = true,
    adaptive_size = true,
    mappings = {
      list = {
        { key = 'm',         action = 'full_rename' },
        { key = 'n',         action = 'create' },
        { key = 'r',         action = 'refresh' },

        { key = '<cr>',      action = 'toggle_mark' },

        { key = 'o',         action = 'system_open' },

        { key = 'K',         action = 'toggle_file_info' },
        { key = 'l',         action = 'edit',            action_cb = edit_or_open },
        { key = 'h',         action = 'close_node' },
        { key = 'H',         action = 'collapse_all',    action_cb = api.collapse_all },
        { key = 'L',         action = 'open_all',    action_cb = api.expand_all },

        { key = '<leader>j', action = 'close' },
        { key = 'q',         action = 'close' },
        { key = '<esc>',     action = 'close' },
      },
    },
  },
  filters = {
    custom =  {
      "^\\.DS_Store",
      "^\\.ipynb_checkpoints",
      "^\\.git",
      "^__pycache__"
    }
  },
  renderer = {
    indent_width = 1,
    add_trailing = true,
    icons = {
      show = { folder = false },
      git_placement = 'signcolumn',
      glyphs = {
        default = '',
        bookmark = '*',
        folder = {
          arrow_closed = '',
          arrow_open = '',
          -- default = '',
          -- open = '',
          -- symlink = '',
          -- symlink_open = '',
        },
      },
    },
  },
  git = { enable = false },
}

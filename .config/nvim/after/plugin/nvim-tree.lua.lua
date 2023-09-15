local ok, tree = pcall(require, 'nvim-tree')
if not ok then return end

local lib = require 'nvim-tree.lib'
local utils = require 'nvim-tree.utils'
local view = require 'nvim-tree.view'
local api = require 'nvim-tree.api'

vim.g.nvim_tree_disable_default_bindings = 1

vim.keymap.set('n', '<leader>j', function() api.tree.toggle { find_file = true, focus = true } end)

local function natural_cmp(left, right)
  -- sort directories first
  if (left.type == 'directory') and (right.type == 'file') then
    return true
  elseif (left.type == 'file') and (right.type == 'directory') then
    return false
  end

  left = left.name:lower()
  right = right.name:lower()

  if left == right then return false end

  for i = 1, math.max(string.len(left), string.len(right)), 1 do
    local l = string.sub(left, i, -1)
    local r = string.sub(right, i, -1)

    if type(tonumber(string.sub(l, 1, 1))) == 'number' and type(tonumber(string.sub(r, 1, 1))) == 'number' then
      local l_number = tonumber(string.match(l, '^[0-9]+'))
      local r_number = tonumber(string.match(r, '^[0-9]+'))

      if l_number ~= r_number then return l_number < r_number end
    elseif string.sub(l, 1, 1) ~= string.sub(r, 1, 1) then
      return l < r
    end
  end
end

local function copy_file_to(node)
  local file_src = node['absolute_path']
  local file_out = vim.fn.input('Copy to: ', file_src, 'file')
  if file_out == '' then return end
  local dir = vim.fn.fnamemodify(file_out, ':h')
  vim.fn.system { 'mkdir', '-p', dir }
  vim.fn.system { 'cp', '-R', file_src, file_out }
end

-- Adapted from the native move function (https://github.com/nvim-tree/nvim-tree.lua/blob/b601b5aa25627f68d3d73ba9269b49e4f04ce126/lua/nvim-tree/actions/fs/rename-file.lua#L18-L32)
local function move_file_to(node)
  local to = vim.fn.input('Move to: ', node.absolute_path, 'file')
  if (vim.loop.fs_stat(to)) then
    print("Destination is not empty.")
    return
  end
  local success, err = vim.loop.fs_rename(node.absolute_path, to)
  if not success then print('Could not move', node.absolute_path, 'to', to, 'Err:', err) end
  utils.rename_loaded_buffers(node.absolute_path, to)
end

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

local function on_attach(bufnr)
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set('n', 'm', function()
    local node = api.tree.get_node_under_cursor()
    move_file_to(node)
  end, opts 'Move')

  vim.keymap.set('n', 'cp', function()
    local node = api.tree.get_node_under_cursor()
    copy_file_to(node)
  end, opts 'Copy')

  vim.keymap.set('n', 'n', api.fs.create, opts 'Create')
  vim.keymap.set('n', 'dd', api.fs.trash, opts 'Trash')
  vim.keymap.set('n', 'D', api.fs.trash, opts 'Trash')
  vim.keymap.set('n', 'r', api.tree.reload, opts 'Refresh')
  vim.keymap.set('n', '<cr>', api.marks.toggle, opts 'Toggle mark')
  vim.keymap.set('n', 'o', api.node.run.system, opts 'System open')
  vim.keymap.set('n', 'K', api.node.show_info_popup, opts 'Show info')
  vim.keymap.set('n', 'l', edit_or_open, opts 'Edit or Open')
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts 'Close node')
  vim.keymap.set('n', 'H', api.tree.collapse_all, opts 'Collapse all')
  vim.keymap.set('n', 'L', api.tree.expand_all, opts 'Expand all')
  vim.keymap.set('n', 'f', api.live_filter.start, opts 'Filter')
  vim.keymap.set('n', '<leader>j', api.tree.close, opts 'Close')
  vim.keymap.set('n', 'q', api.tree.close, opts 'Close')
  vim.keymap.set('n', '<esc>', api.tree.close, opts 'Close')
  vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Help')
  vim.keymap.set('n', 'u', api.tree.toggle_custom_filter, opts 'Toggle hidden')

  vim.keymap.set('n', 'P', function()
    local node = api.tree.get_node_under_cursor()
    print(node.absolute_path)
  end, opts 'Print Node Path')
end

tree.setup {
  on_attach = on_attach,
  sort_by = function(nodes) table.sort(nodes, natural_cmp) end,
  view = {
    adaptive_size = true,
    signcolumn = 'no',
  },
  filters = {
    dotfiles = false,
    git_clean = false,
    custom = {
      '^\\.DS_Store',
      '^\\.ipynb_checkpoints',
      '^\\.git',
      '^__pycache__',
    },
  },
  renderer = {
    indent_width = 2,
    add_trailing = true,
    root_folder_label = false,
    icons = {
      show = { folder = false },
      git_placement = 'signcolumn',
      glyphs = {
        default = '',
        bookmark = '*',
        folder = {
          arrow_closed = '  ',
          arrow_open = '  ',
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

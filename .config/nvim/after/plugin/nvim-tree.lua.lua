local lib = require 'nvim-tree.lib'
local view = require 'nvim-tree.view'
local api = require 'nvim-tree.api'

vim.g.nvim_tree_disable_default_bindings = 1

vim.keymap.set('n', '<leader>j', function() api.tree.open() end)

local function natural_cmp(left, right)
  -- sort directories first
  print(left.type, right.type)
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
  -- The args of input are {prompt}, {default}, {completion}
  -- Read in the new file path using the existing file's path as the baseline.
  local file_out = vim.fn.input('COPY TO: ', file_src, 'file')
  -- Create any parent dirs as required
  local dir = vim.fn.fnamemodify(file_out, ':h')
  vim.fn.system { 'mkdir', '-p', dir }
  -- Copy the file
  vim.fn.system { 'cp', '-R', file_src, file_out }
end

local function copy_things(bufnr)
  print 'Copy:  [F]ile  -  Bu[f]fer Relative Path  -  CWD Relative [p]ath  -  Absolute [P]ath  -  [N]ame'

  local maps = {
    F = function() copy_file_to(lib.get_node_at_cursor()) end,
    f = api.fs.copy.relative_path,
    p = function() print 'p' end,
    P = api.fs.copy.absolute_path,
    N = api.fs.copy.name,
  }

  for k, cb in pairs(maps) do
    vim.keymap.set('n', k, function()
      cb()

      for k2 in pairs(maps) do
        vim.keymap.del('n', k2, { buffer = bufnr })
      end
    end, { buffer = bufnr })
  end
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

local function on_attach(bufnr)
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set('n', 'm', api.fs.rename, opts 'Rename')
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
  vim.keymap.set('n', 'Y', copy_things, opts 'Copy')
  vim.keymap.set('n', 'yy', copy_things, opts 'Copy')

  vim.keymap.set('n', 'P', function()
    local node = api.tree.get_node_under_cursor()
    print(node.absolute_path)
  end, opts 'Print Node Path')
end

require('nvim-tree').setup {
  on_attach = on_attach,
  sort_by = function(nodes) table.sort(nodes, natural_cmp) end,
  view = { hide_root_folder = true, adaptive_size = true },
  filters = {
    custom = {
      '^\\.DS_Store',
      '^\\.ipynb_checkpoints',
      '^\\.git',
      '^__pycache__',
    },
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

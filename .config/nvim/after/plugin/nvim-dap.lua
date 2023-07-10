local ok, dap = pcall(require, 'dap')
if not ok then return end

local widgets = require 'dap.ui.widgets'

require('dap-vscode-js').setup {
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
}

for _, language in ipairs { 'typescript', 'javascript' } do
  dap.configurations[language] = {
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch file',
      program = '${file}',
      cwd = '${workspaceFolder}',
    },
    {
      type = 'pwa-node',
      request = 'attach',
      name = 'Attach',
      processId = require('dap.utils').pick_process,
      cwd = '${workspaceFolder}',
    },
  }
end

local floatWinNr = nil
-- Most of this is adapted from nvim-dap/lua/dap/ui/widgets.lua's .hover()
-- vim.keymap.set({ 'n', 'v' }, 'L', function()
--   -- Abort if dap is not running
--   if not dap.session() then
--     print 'DAP unavailable.'
--     return
--   end
--
--   -- Allows you to do L L to focus on the hover, like with the LSP's hover
--   if floatWinNr then
--     vim.api.nvim_set_current_win(floatWinNr)
--     floatWinNr = nil
--     return
--   end
--
--   local function with_winopts(new_win, winopts)
--     return function(...)
--       local win = new_win(...)
--       ui.apply_winopts(win, winopts)
--       return win
--     end
--   end
--
--   -- Determine what should be shown in the float
--   local value
--   if vim.fn.mode() == 'v' then
--     vim.cmd 'noau normal! "vy"'
--     value = vim.fn.getreg 'v'
--   end
--   value = value or vim.fn.expand '<cword>'
--
--   -- Create float and open it
--   local view = widgets
--       .builder(widgets.expression)
--       .keep_focus()
--       .new_win(widgets.with_resize(with_winopts(widgets.new_cursor_anchored_float_win, { border = 'rounded' })))
--       .build()
--   view.open(value)
--   -- vim.api.nvim_buf_set_name(bufnr, 'dap-hover-' .. tostring(bufnr) .. ': ' .. value)
--
--   floatWinNr = view.win
--
--   -- Hide the float as soon as you move
--   vim.api.nvim_create_autocmd({ 'CursorMoved', 'BufLeave' }, {
--     once = true,
--     callback = function()
--       local win = vim.api.nvim_get_current_win()
--       if win == floatWinNr then return end
--       -- view.close()
--       -- floatWinNr = nil
--     end,
--   })
-- end)

vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)

-- vim.keymap.set(
--   'n',
--   '<Leader>lp',
--   function() require('dap').set_breakpoint(nil, nil, vim.fn.input 'Log point message: ') end
-- )

vim.keymap.set('n', '<Leader>d', function() dap.repl.toggle { height = 10 } end)

vim.keymap.set({ 'n', 'v' }, 'L', function() widgets.hover() end)

local function with_refresh(new_buf_, listener)
  local listeners
  if type(listener) == 'table' then
    listeners = listener
  else
    listeners = { listener }
  end
  return function(view)
    for _, l in pairs(listeners) do
      dap.listeners.after[l][view] = view.refresh
    end
    local buf = new_buf_(view)
    vim.api.nvim_buf_attach(buf, false, {
      on_detach = function()
        for _, l in pairs(listeners) do
          dap.listeners.after[l][view] = nil
        end
      end,
    })
    return buf
  end
end

local sidebarBufs = {}
vim.keymap.set('n', '<Leader>D', function()
  if #sidebarBufs > 0 then
    for _, buf in pairs(sidebarBufs) do
      vim.api.nvim_buf_delete(buf, {})
      sidebarBufs = {}
    end
    return
  end

  widgets
      .builder(widgets.sessions)
      .new_win(function()
        vim.cmd '30 vsplit'
        local win = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_option(win, 'number', false)
        vim.api.nvim_win_set_option(win, 'relativenumber', false)
        vim.api.nvim_win_set_option(win, 'statusline', 'frames')
        vim.api.nvim_win_set_option(win, 'signcolumn', 'no')
        return win
      end)
      .new_buf(function(...)
        sidebarBufs[#sidebarBufs + 1] = widgets.sessions.new_buf(...)
        return sidebarBufs[#sidebarBufs]
      end)
      .build()
      .open()

  widgets
      .builder(widgets.scopes)
      .new_win(function()
        vim.cmd 'split'
        local win = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_option(win, 'number', false)
        vim.api.nvim_win_set_option(win, 'relativenumber', false)
        vim.api.nvim_win_set_option(win, 'statusline', 'scopes')
        vim.api.nvim_win_set_option(win, 'signcolumn', 'no')
        return win
      end)
      .new_buf(function(...)
        sidebarBufs[#sidebarBufs + 1] = widgets.scopes.new_buf(...)
        return sidebarBufs[#sidebarBufs]
      end)
      .build()
      .open()
end)

-- vim.keymap.set({ 'n', 'v' }, 'L', dapui.eval)
-- local pages = { 'scopes', 'breakpoints', 'stacks', 'watches', 'repl', 'console' }
-- vim.api.nvim_create_user_command('DapUIToggle', function(t)
--   local function handle_choice()
--     if t.fargs[1] == 'scopes' then
--       dapui.toggle { layout = 1 }
--     elseif t.fargs[1] == 'breakpoints' then
--       dapui.toggle { layout = 2 }
--     elseif t.fargs[1] == 'stacks' then
--       dapui.toggle { layout = 3 }
--     elseif t.fargs[1] == 'watches' then
--       dapui.toggle { layout = 4 }
--     elseif t.fargs[1] == 'repl' then
--       dapui.toggle { layout = 5 }
--     elseif t.fargs[1] == 'console' then
--       dapui.toggle { layout = 6 }
--     end
--   end
--   if t.fargs[1] then
--     handle_choice()
--   else
--     vim.ui.select(pages, {
--       prompt = 'Open DAP UI pane: ',
--     }, function(choice)
--       t.fargs[1] = choice
--       handle_choice()
--     end)
--   end
-- end, {
--   nargs = '?',
--   complete = function() return pages end,
-- })
-- vim.keymap.set({ 'n', 'v' }, '<leader>d', ':DapUIToggle <cr>')

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/local/opt/llvm/bin/lldb-vscode',
  name = 'lldb',
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function() return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file') end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = true,
  },

  {
    name = 'Compile + Launch (single file)',
    type = 'lldb',
    request = 'launch',
    program = function()
      local exe = os.getenv 'TMPDIR' .. 'cpp_sfc_tmp.out'
      local src = vim.api.nvim_buf_get_name(0)
      local gcc_cmd = 'g++ -std=c++17 -g -o ' .. exe .. ' ' .. src
      print(gcc_cmd)
      os.execute(gcc_cmd)
      return exe
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = true,
  },
}

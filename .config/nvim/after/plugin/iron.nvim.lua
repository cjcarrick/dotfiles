if not pcall(require, 'iron.core') then return end
local iron = require 'iron.core'
local view = require 'iron.view'
iron.setup {
    config = {
        should_map_plug = false,
        scratch_repl = true,
        repl_definition = {
            python = {
                command = { 'ipython' },
                format = require('iron.fts.common').bracketed_paste,
            },
        },
        repl_open_cmd = view.split.vertical.botright(0.5),
    },
    keymaps = {
        send_motion = 'ctx',
        visual_send = 'ctx',
    },
}

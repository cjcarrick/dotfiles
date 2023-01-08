vim.g["fern#default_hidden"] = 1
vim.g["fern#hide_cursor"] = 1
vim.g["fern#renderer"] = "nerdfont"
vim.g["fern#renderer#nerdfont#padding"] = " "
vim.g["fern#disable_default_mappings"] = 1
vim.g["fern#default_exclude"] = ".DS_Store"

vim.keymap.set("n", "<leader>j", function()
  if vim.api.nvim_buf_get_name(0) == "" then
    vim.cmd(":Fern . -drawer -toggle")
  else
    vim.cmd(":Fern . -reveal=% -toggle -drawer")
  end
end)

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "fern",
  callback = function()
    local set = function(key, action)
      vim.keymap.set("n", key, action, { buffer = true })
    end

    vim.opt_local.number = false
    vim.opt_local.signcolumn = 'no'
    vim.opt_local.relativenumber = false

    set("n", "<Plug>(fern-action-new-path=)")
    set("m", "<Plug>(fern-action-move)")
    set("c", "<Plug>(fern-action-clipboard-copy)")
    set("p", "<Plug>(fern-action-clipboard-paster)")
    set("D", "<Plug>(fern-action-trash)")

    set("h", "<Plug>(fern-action-collapse)")
    set("l", "<Plug>(fern-action-open-or-expand)")

    -- fern git plugin controls
    set("ga", ">>")
    set("gr", "<<")

    set("r", "<Plug>(fern-action-reload)")

    set("i", "<Plug>(fern-action-include)")
    set("e", "<Plug>(fern-action-exclude)")

    set("<cr>", "<Plug>(fern-action-mark)")
    set("<S-j>", "<Plug>(fern-action-mark) | j")
    set("<S-k>", "k | <Plug>(fern-action-mark)")

    -- vim.fn['glyph_palette#apply']()
    vim.cmd(":call glyph_palette#apply()")
  end,
})

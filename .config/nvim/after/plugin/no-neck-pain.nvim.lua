if not pcall(require, 'no-neck-pain') then return end

require('no-neck-pain').setup {
  mappings = {
    enabled = true,
    toggle = '<Leader>np',
  },
}

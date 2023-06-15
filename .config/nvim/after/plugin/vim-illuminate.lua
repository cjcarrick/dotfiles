if not pcall(require, 'illuminate') then return end

require('illuminate').configure {
  providers = { 'regex' },
  delay = 0,
  filetypes_denylist = { 'fern', 'NvimTree', 'Telescope' }
}


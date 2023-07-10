local ok, illuminate = pcall(require, 'illuminate')
if not ok then return end

require('illuminate').configure {
  providers = { 'regex' },
  delay = 0,
  filetypes_denylist = { 'fern', 'NvimTree', 'Telescope' },
}

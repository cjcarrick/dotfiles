local ok, ua = pcall( require, 'ultimate-autopair' )
if not ok then return end

ua.setup {
  multiline  = true,
}

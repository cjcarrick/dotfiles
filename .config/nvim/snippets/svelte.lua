return {
  s('scr', fmt('<script{}>\n{}\n</script>', { i(1, ' lang="ts"'),   i(0) })),
  s('sty', fmt('<style{}>\n{}\n</style>',   { i(1, ' lang="scss"'), i(0) })),
}

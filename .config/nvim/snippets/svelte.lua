return {
  s('scr', fmt('<script{}>\n{}\n</script>', { i(1, ' lang="ts"'),   i(0) })),
  s('sty', fmt('<style{}>\n{}\n</style>',   { i(1, ' lang="scss"'), i(0) })),

  s('cl',   fmt('console.log({})',     { i(1, "'message'") }), { hidden = true }),
  s('cw',   fmt('console.warn({})',    { i(1, "'message'") }), { hidden = true }),
  s('ce',   fmt('console.error({})',   { i(1, "'message'") }), { hidden = true }),
}

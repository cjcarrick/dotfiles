return {
  s('scr', fmt('<script{}{}>\n{}\n</script>', { i(1, ' setup'),  i(2, ' lang="ts"'),   i(0) })),
  s('sty', fmt('<style{}{}>\n{}\n</style>',   { i(1, ' scoped'), i(2, ' lang="scss"'), i(0) })),
  s('tem', fmt('<template>\n{}\n</template>', { i(0) })),
}

return {
  s('fun', fmt('fun {}({}: {}) {{\n  {}}}', { i(1, 'function'), i(2, 'arg'), i(3, 'type'), i(4) })),
  s('if', fmt('if ({}) {{\n  {}\n}}', { i(1, 'condition'), i(2) })),
  s('mat', fmt('match ({}) {{\n  {}\n}}', { i(1, 'statement'), i(2) })),
}

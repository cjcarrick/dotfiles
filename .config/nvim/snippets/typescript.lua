return {
  s('fun', fmt('function {}({}: {}) {{\n  {}\n}}', { i(1, 'fun'), i(2, 'arg'), i(3, 'type'), i(4) })),

  s('if', fmt('if ({}) {{\n  {}\n}}', { i(1, 'condition'), i(2) })),
  s('whi', fmt('while ({}) {{\n  {}\n}}', { i(1, 'condition'), i(2) })),

  s('stri', fmt('JSON.stringify({}, null, 2)', { i(1, '/* object */') })),

  s('cla', fmt('class {} {{\n  constructor({}) {{\n    {}\n  }}\n\n  {}\n}}', { i(1, 'ClassName'), i(2), i(3), i(4) })),

  s('meth', fmt('{} = ({}: {}) => {{\n  \n}}', { i(1, 'methodName'), i(2, 'arg'), i(3, 'type') })),

  s('cl', fmt('console.log({})', { i(1, "'message'") })),
  s('cw', fmt('console.warn({})', { i(1, "'message'") })),
  s('ce', fmt('console.error({})', { i(1, "'message'") })),

  s('tne', fmt('throw new Error({})', { i(1, "'message'") })),

  s('sett', fmt('setTimeout(() => {{\n  {}\n}}, {})', { i(2, ''), i(1, '1000') })),
  s('seti', fmt('setInterval(() => {{\n  {}\n}}, {})', { i(2, ''), i(1, '1000') })),

  s(
    'for',
    c(1, {
      fmt('for (let {} = 0; {} < {}; {}++) {{\n  {}\n}}', { i(1, 'i'), rep(1), i(2, 'max'), rep(1), i(3) }),
      fmt(
        'for (let {} = 0, {} = {}.length; {} < {}; {}++) {{\n  const {} = {}[{}]\n  {}\n}}',
        { i(1, 'i'), i(2, 'len'), i(3, 'arr'), rep(1), rep(2), rep(1), i(4, 'el'), rep(3), rep(1), i(4) }
      ),
    })
  ),
}

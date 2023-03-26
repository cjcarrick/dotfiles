---Attempts to (in decreasing order of presedence):
-- - Convert a plural noun into a singular noun
-- - Return the first letter of the word
-- - Return "item" as a fallback
local function singular(input)
  local plural_word = input[1][1]
  local last_word = string.match(plural_word, '[_%w]*$')

  -- initialize with fallback
  local singular_word = 'item'

  if string.match(last_word, '.s$') then
    -- assume the given input is plural if it ends in s. This isn't always
    -- perfect, but it's pretty good
    singular_word = string.gsub(last_word, 's$', '', 1)

  elseif string.match(last_word, '^_?%w.+') then
    -- include an underscore in the match so that inputs like '_name' will
    -- become '_n' and not just '_'
    singular_word = string.match(last_word, '^_?.')
  end

  return s('{}', i(1, singular_word))
end

return {
    s('if',   fmt('if ({}) {{\n  {}\n}}',    { i(1, 'condition'), i(2) })),
    s('whi',  fmt('while ({}) {{\n  {}\n}}', { i(1, 'condition'), i(2) })),

    s('stri', fmt('JSON.stringify({}, null, 2)', { i(1, '/* object */') })),

    s('cla',  fmt('class {} {{\n  constructor({}) {{\n    {}\n  }}\n\n  {}\n}}', { i(1, 'ClassName'), i(2), i(3), i(4) })),
    s('meth', fmt('{} = ({}: {}) => {{\n  \n}}', { i(1, 'methodName'), i(2, 'arg'), i(3, 'type') })),

    s('cl',   fmt('console.log({})',     { i(1, "'message'") })),
    s('cw',   fmt('console.warn({})',    { i(1, "'message'") })),
    s('ce',   fmt('console.error({})',   { i(1, "'message'") })),
    s('tne',  fmt('throw new Error({})', { i(1, "'message'") })),

    s('sett', fmt('setTimeout(() => {{\n  {}\n}}, {})',  { i(2, ''), i(1, '1000') })),
    s('seti', fmt('setInterval(() => {{\n  {}\n}}, {})', { i(2, ''), i(1, '1000') })),

    s(
        'for',
        c(1, {
            fmt(
                'for (let {} = 0; {} < {}.length; {}++) {{\n  const {} = {}[{}]\n  {}\n}}',
                { i(1, 'i'), rep(1), i(2, 'arr'), rep(1), d(3, singular, { 2 }), rep(2), rep(1), i(4) }
            ),
            fmt('for (let {} = 0; {} < {}; {}++) {{\n  {}\n}}', { i(1, 'i'), rep(1), i(2, 'max'), rep(1), i(3) }),
            fmt('for (let {} = 0, {} = {}.length; {} < {}; {}++) {{\n  const {} = {}[{}]\n  {}\n}}', {
                i(1, 'i'),
                i(3, 'len'),
                i(2, 'arr'),
                rep(1),
                rep(3),
                rep(1),
                d(4, singular, { 2 }),
                rep(2),
                rep(1),
                i(5),
            }),
        })
    ),
}

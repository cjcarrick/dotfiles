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
    s('if', fmt('if ({}) {{\n    {}\n}}', { i(1, 'condition'), i(2) })),
    s('whi', fmt('while ({}) {{\n    {}\n}}', { i(1, 'condition'), i(2) })),
    s(
        'main',
        c(1, {
            fmt('int main()\n{{\n    {}\n\n    return 0;\n}}', { i(1) }),
            fmt('int main(int argc, char **argv) {{\n    {}\n\n    return 0;\n}}', { i(1) }),
        })
    ),

    s('incl', { t( '#include ' ) }),

  -- Disabled because it's not that hard to type "() {<cr>}"
  -- -- Automatically expand functions on <returntype> <funcname>{
  -- -- TODO: convert this to just an autocmd
  -- postfix({
  --   trig = '[^ ]+{',
  --   snippetType = 'autosnippet',
  --   match_pattern = '^[^ ]+ $',
  --   regTrig = true,
  -- }, {
  --   d(
  --     1,
  --     function(_, parent)
  --       return
  --           sn(
  --             nil,
  --             c(1, {
  --               fmt(
  --                 parent.env.POSTFIX_MATCH
  --                 .. parent.env.LS_TRIGGER:sub(0, parent.env.LS_TRIGGER:len() - 1)
  --                 .. '({})\n{{\n  {}\n\n',
  --                 { i(1, 'args'), i(2) }
  --               ),
  --               fmt(
  --                 parent.env.POSTFIX_MATCH
  --                 .. parent.env.LS_TRIGGER:sub(0, parent.env.LS_TRIGGER:len() - 1)
  --                 .. '()\n{{\n  {}\n\n',
  --                 { i(1) }
  --               ),
  --             })
  --           )
  --     end
  --   ),
  -- }, {
  --   condition = function(line_to_cursor)
  --     return line_to_cursor:match '^[^ ]+ [^ ]+{' and line_to_cursor .. '}' == vim.api.nvim_get_current_line()
  --   end,
  -- }),

  -- s(
  --   'for',
  --   c(1, {
  --     fmt('for (int {} = 0; {} < {}; {}++) {{\n    {}\n}}', { i(1, 'i'), rep(1), i(2, 'max'), rep(1), i(3) }),
  --     fmt(
  --       'for (int {} = 0; {} < {}; {}++) {{\n    {} {} = {}[{}]\n  {}\n}}',
  --       { i(1, 'i'), rep(1), i(2, 'max'), rep(1), i(3, 'type'), d(4, singular, { 2 }), rep(2), rep(1), i(5) }
  --     ),
  --   })
  -- ),
}

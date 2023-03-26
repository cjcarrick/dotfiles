local ts_utils = require("nvim-treesitter.ts_utils")

local function uuid()
  local template = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
  return string.gsub(template, '[xy]', function(c)
        local v = (c == 'x') and math.random(0, 0xf) or math.random(8, 0xb)
        return string.format('%x', v)
      end)
end

-- @return boolean
local function in_comment_or_string() --{{{
  local current_node = ts_utils.get_node_at_cursor()
  if not current_node then return false end
  local expr = current_node
  return expr:type() == 'comment' or expr:type() == 'string'
end --}}}

return {
    s(
        'place',
        fmt('https://placebear.com/{}/{}', { i(1, '256'), i(2, '256') }),
        { show_condition = in_comment_or_string }
    ),
    s(
        'place2',
        fmt('https://placebear.com/{}/{}', { i(1, '256'), i(2, '256') }),
        { show_condition = in_comment_or_string }
    ),
    s('uuid', f(uuid, {}, {})),
}

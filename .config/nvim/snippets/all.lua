local function uuid()
  local template = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
  return string.gsub(template, '[xy]', function(c)
    local v = (c == 'x') and math.random(0, 0xf) or math.random(8, 0xb)
    return string.format('%x', v)
  end)
end

return {
  s('!place', fmt('https://placebear.com/{}/{}', { i(1, '256'), i(2, '256') }), {
  }),
  s('!uuid', f(uuid, {}, {}), {
  }),

  s('!dt', f(function() return os.date '%b %d, %Y %I:%m' end, {}, {}), {
  }),
  s('!iso', f(function() return os.date '%Y-%M-%dT%H:%m:%S%z' end, {}, {}), {
  }),
}

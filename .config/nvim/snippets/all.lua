local function uuid()
  local template = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
  return string.gsub(template, '[xy]', function(c)
    local v = (c == 'x') and math.random(0, 0xf) or math.random(8, 0xb)
    return string.format('%x', v)
  end)
end

return {
  s('place', fmt('https://placebear.com/{}/{}', { i(1, '256'), i(2, '256') })),
  s('place2', fmt('https://placebear.com/{}/{}', { i(1, '256'), i(2, '256') })),
  s('uuid', c(1, { f(uuid, {}, {}), f(uuid, {}, {}) })),
}

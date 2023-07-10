util = {}

-- This works like:
--
--   local ok, mod = `pcall(require, 'module')`
--
-- except that it can be written:
--
--   local ok, mod1, mod2 = `safe_require{ 'module1', 'module2' }`
--
-- and can take any number of modules
--
util.safe_require = function(modules)
  local results = { true }
  for _, module in pairs(modules) do
    local ok, m = pcall(require, module)
    if not ok then return { false } end
    table.insert(results, m)
  end
  return unpack(results)
end

return util

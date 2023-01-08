local ccc = require 'ccc'
ccc.setup {
  highlighter = { auto_enable = true },
  inputs = {
    ccc.input.hsl,
    ccc.input.rgb,
  },
  outputs = {
    ccc.output.hex,
    ccc.output.css_rgb,
    ccc.output.css_hsl,
  },
}

-- return {
--   s('#!', fmt '/usr/bin/env/bash\n'),
--   -- s('if', fmt('if [[ {} ]]; then\n  {}\nend}}', { i(1, 'condition'), i(2) })),
--   -- s('elif', fmt('elif [[ {} ]]; then\n  {}', { i(1, 'condition'), i(2) })),
--   -- s('fun', fmt('function {} {{\n  {}', { i(1, 'fun'), i(2) })),
--   -- s('for', fmt('for (({} = 0; {} < {}; {}++)); do\n  {}\ndone', { i(1, 'i'), rep(1), i(2, 'max'), rep(1), i(4) })),
-- }
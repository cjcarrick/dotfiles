
-- Defines highlight groups for different file ttypes
---@type { color: { fg : string, ctermfg : number } }
local colors = {
  black      = { fg = '#202020', ctermfg = 0  }, -- popups, etc. use sparingly
  -- black      = { fg = '#282828', ctermfg = 0  }, -- popups, etc. use sparingly
  darkGray   = { fg = '#282828', ctermfg = 0  }, -- normal background
  gray       = { fg = '#3f3f3f', ctermfg = 7  }, -- cursorline, etc
  brightGray = { fg = '#606060', ctermfg = 15 }, -- comments, etc
  white      = { fg = '#ebdbb2', ctermfg = 7  }, -- main text colors

  red    = { fg = '#c15550', ctermfg = 1  },
  orange = { fg = '#cf813c', ctermfg = 14 },
  yellow = { fg = '#dead2a', ctermfg = 3  },
  green  = { fg = '#98971a', ctermfg = 2  },
  blue   = { fg = '#458588', ctermfg = 4  },
  cyan   = { fg = '#689d6a', ctermfg = 6  },
  purple = { fg = '#b85b96', ctermfg = 5  },
  pink   = { fg = '#b85b96', ctermfg = 13  },

  brightYellow = { fg = '#605222', ctermfg = 11 },
  brightRed    = { fg = '#743e3c', ctermfg = 9 },
  brightGreen  = { fg = '#40451d', ctermfg = 10 },
  brightBlue   = { fg = '#365658', ctermfg = 12 },

  NONE = { fg = 'NONE', ctermfg = 'NONE' }
}

---@type { icon: { icon: string, hl: string } }
local icon_table = {
  ['txt'] =                  { icon = ' ',    hl = 'white' },
  --
  ['sh'] =                   { icon = 'sh',   hl = 'green' },
  ['shell'] =                { icon = 'sh',   hl = 'green' },
  ['awk'] =                  { icon = 'sh',   hl = 'green' },
  ['.bashprofile'] =         { icon = 'sh',   hl = 'orange' },
  ['.bashrc'] =              { icon = 'sh',   hl = 'orange' },
  ['bash'] =                 { icon = 'sh',   hl = 'orange' },
  ['bash_history'] =         { icon = 'sh',   hl = 'orange' },
  ['bash_profile'] =         { icon = 'sh',   hl = 'orange' },
  ['bashrc'] =               { icon = 'sh',   hl = 'orange' },
  ['bats'] =                 { icon = 'sh',   hl = 'orange' },
  ['.zprofile'] =            { icon = 'zsh',  hl = 'green' },
  ['.zshrc'] =               { icon = 'zsh',  hl = 'green' },
  ['zsh'] =                  { icon = 'zsh',  hl = 'green' },
  ['zsh-theme'] =            { icon = 'zsh',  hl = 'green' },
  ['zshrc'] =                { icon = 'zsh',  hl = 'green' },
  ['ksh'] =                  { icon = 'ksh',  hl = 'purple' },
  ['fish'] =                 { icon = 'fsh',  hl = 'blue' },
  ['ps1'] =                  { icon = 'win',  hl = 'blue' },
  ['mk'] =                   { icon = 'win',  hl = 'blue' },
  ['csh'] =                  { icon = 'win',  hl = 'blue' },
  ['cmd'] =                  { icon = 'win',  hl = 'blue' },
  ['msi'] =                  { icon = 'win',  hl = 'blue' },
  ['ini'] =                  { icon = 'win',  hl = 'blue' },
  ['bat'] =                  { icon = 'win',  hl = 'blue' },
  ['cab'] =                  { icon = 'win',  hl = 'blue' },
  --
  ['cfg'] =                  { icon = 'cfg',  hl = 'white' },
  ['toml'] =                 { icon = 'toml',  hl = 'red' },
  ['conf'] =                 { icon = 'conf',  hl = 'white' },
  ['editorconfig'] =         { icon = 'cnf',  hl = 'white' },
  ['.env'] =                 { icon = 'env',  hl = 'white' },
  --
  ['img'] =                  { icon = 'img',  hl = 'white' },
  ['iso'] =                  { icon = 'img',  hl = 'white' },
  ['so'] =                   { icon = 'l',    hl = 'blue' },
  ['pkgbuild'] =             { icon = 'a',    hl = 'blue' },
  ['ebuild'] =               { icon = 'g',    hl = 'purple' },
  ['deb'] =                  { icon = 'd',    hl = 'orange' },
  ['android'] =              { icon = 'a',    hl = 'green' },
  ['apk'] =                  { icon = 'apk',  hl = 'green' },
  ['.DS_Store'] =            { icon = 'tmp',  hl = 'brightGray' },
  ['ds_store'] =             { icon = 'tmp',  hl = 'brightGray' },
  ['apple'] =                { icon = 'apl',  hl = 'white' },
  ['localized'] =            { icon = 'apl',  hl = 'white' },
  ['dll'] =                  { icon = 'w',    hl = 'blue' },
  ['exe'] =                  { icon = 'exe',  hl = 'orange' },
  ['windows'] =              { icon = 'win',  hl = 'blue' },
  --
  ['/Trash.$'] =             { icon = 'tmp',  hl = 'white' },
  ['/.Trash-d+.$'] =         { icon = 'tmp',  hl = 'white' },
  --
  ['.gitattributes'] =       { icon = 'git',  hl = 'orange' },
  ['.gitconfig'] =           { icon = 'git',  hl = 'orange' },
  ['.gitignore'] =           { icon = 'git',  hl = 'orange' },
  ['.gitmodules'] =          { icon = 'git',  hl = 'orange' },
  ['/.git.$'] =              { icon = 'git',  hl = 'orange' },
  ['git'] =                  { icon = 'git',  hl = 'orange' },
  ['gitattributes'] =        { icon = 'git',  hl = 'orange' },
  ['gitmodules'] =           { icon = 'git',  hl = 'orange' },
  ['diff'] =                 { icon = 'dif',  hl = 'orange' },
  ['patch'] =                { icon = 'dif',  hl = 'orange' },
  ['.gitlab-ci.yml'] =       { icon = 'lab',  hl = 'red' },
  --
  ['readme'] =               { icon = 'i',    hl = 'blue' },
  ['readme.*'] =             { icon = 'i' },
  ['readme.md'] =            { icon = 'i' },
  ['rmd'] =                  { icon = 'i' },
  --
  ['.*vimrc.*'] =            { icon = 'v',    hl = 'green' },
  ['vim'] =                  { icon = 'Vim' },
  ['.gvimrc'] =              { icon = 'Vim' },
  ['.vimrc'] =               { icon = 'Vim' },
  ['_gvimrc'] =              { icon = 'Vim' },
  ['_vimrc'] =               { icon = 'Vim' },
  ['/.atom.$'] =             { icon = 'a' },
  ['iml'] =                  { icon = 'i',    hl = 'blue' },
  ['/.idea.$'] =             { icon = 'Idea' },
  ['sln'] =                  { icon = 'v',    hl = 'blue' },
  ['suo'] =                  { icon = 'VisualStudio' },
  ['ai'] =                   { icon = 'i',    hl = 'orange' },
  ['psb'] =                  { icon = 'p',    hl = 'blue' },
  ['psd'] =                  { icon = 'p' },
  --
  ['/include.$'] =           { icon = 's' },
  --
  ['Vagrantfile$'] =         { icon = 'l',    hl = 'green' },
  --
  ['c'] =                    { icon = 'c',    hl = 'blue' },
  ['cuh'] =                  { icon = 'h',    hl = 'white' },
  ['h'] =                    { icon = 'h' },
  ['m'] =                    { icon = 'm',    hl = 'blue' },
  ['cmakelists.txt'] =       { icon = 'm',    hl = 'white' },
  ['makefile'] =             { icon = 'm' },
  --
  ['c++'] =                  { icon = 'cpp', hl = 'blue' },
  ['cc'] =                   { icon = 'cc',  hl = 'blue' },
  ['cp'] =                   { icon = 'cp',  hl = 'blue' },
  ['cpp'] =                  { icon = 'cpp', hl = 'blue' },
  ['cu'] =                   { icon = 'cu',  hl = 'blue' },
  ['cxx'] =                  { icon = 'cxx', hl = 'blue' },
  ['mm'] =                   { icon = 'mm',  hl = 'blue' },
  --
  ['csx'] =                  { icon = 'csx',  hl = 'blue' },
  ['csproj'] =               { icon = 'cspr', hl = 'blue' },
  ['cs'] =                   { icon = 'cs',   hl = 'blue' },
  --
  ['swift'] =                { icon = 'swft', hl = 'orange' },
  ['xcplayground'] =         { icon = 'xcpg', hl = 'orange' },
  --
  ['htm'] =                  { icon = 'htm',  hl = 'orange' },
  ['html'] =                 { icon = 'htm',  hl = 'orange' },
  ['xhtml'] =                { icon = 'htm',  hl = 'orange' },
  ['haml'] =                 { icon = 'hml',  hl = 'pink'   },
  ['pug'] =                  { icon = 'pyg',  hl = 'red'    },
  ['mustache'] =             { icon = 'mst',  hl = 'green'  },
  ['hbs'] =                  { icon = 'hbs',  hl = 'red'    },
  ['vue'] =                  { icon = 'vue',  hl = 'green'  },
  ['svelte'] =               { icon = 'svt',  hl = 'orange' },
  --
  ['php'] =                  { icon = 'php',  hl = 'purple' },
  --
  ['css'] =                  { icon = 'css',  hl = 'blue'   },
  ['less'] =                 { icon = 'less', hl = 'blue'   },
  ['scss'] =                 { icon = 'scss', hl = 'pink'   },
  ['sass'] =                 { icon = 'sass', hl = 'pink'   },
  ['styl'] =                 { icon = 'styl', hl = 'green'  },
  ['stylus'] =               { icon = 'styl', hl = 'green'  },
  ['cjs'] =                  { icon = 'js',   hl = 'yellow' },
  ['mjs'] =                  { icon = 'js',   hl = 'yellow' },
  ['js'] =                   { icon = 'js',   hl = 'yellow' },
  ['jsx'] =                  { icon = 'jsx',  hl = 'blue'   },
  ['node'] =                 { icon = 'node', hl = 'green'  },
  ['npmignore'] =            { icon = 'npm',  hl = 'red'    },
  ['.npmrc'] =               { icon = 'npm',  hl = 'red'    },
  --
  ['coffee'] =               { icon = 'cfe' },
  ['json'] =                 { icon = 'json', hl = 'yellow' },
  ['avro'] =                 { icon = 'j' },
  ['jsonc'] =                { icon = 'json', hl = 'yellow' },
  ['properties'] =           { icon = 'j' },
  ['webmanifest'] =          { icon = 'j' },
  --
  ['ts'] =                   { icon = 'ts',   hl = 'blue' },
  ['tsx'] =                  { icon = 'tsx',  hl = 'blue' },
  ['tsconfig.*.json$'] =     { icon = 'json', hl = 'blue' },
  ['tsconfig.json'] =        { icon = 'json', hl = 'blue' },
  --
  ['.*materialize.*.css$'] = { icon = 'm',    hl = 'red' },
  ['.*materialize.*.js$'] =  { icon = 'Materialize' },
  --
  ['.*mootools.*.js$'] =     { icon = 'moo' },
  ['.*require.*.js$'] =      { icon = 'requ' },
  ['.*angular.*.js$'] =      { icon = 'ang',    hl = 'red' },
  ['.*backbone.*.js$'] =     { icon = 'Backbone' },
  --
  ['gruntfile.coffee'] =     { icon = 'grnt',    hl = 'red' },
  ['gruntfile.js'] =         { icon = 'grnt' ,    hl = 'red' },
  ['gruntfile.ls'] =         { icon = 'grnt' ,    hl = 'red' },
  ['gulpfile.coffee'] =      { icon = 'gulp',    hl = 'red' },
  ['gulpfile.js'] =          { icon = 'gulp',    hl = 'red'  },
  ['gulpfile.ls'] =          { icon = 'gulp' ,    hl = 'red' },
  --
  ['.eslintrc.cjs'] =        { icon = 'esln',    hl = 'purple' },
  ['.eslintrc.js'] =         { icon = 'esln' , hl = 'purple' },
  ['.eslintignore'] =        { icon = 'esln',    hl = 'white' },
  --
  ['.prettierignore'] =      { icon = 'p',    hl = 'white' },
  ['.prettierrc'] =          { icon = 'p',    hl = 'pink' },
  --
  ['clj'] =                  { icon = 'clj',    hl = 'green' },
  ['cljc'] =                 { icon = 'cljc' ,    hl = 'green' },
  ['cljs'] =                 { icon = 'cljs' ,    hl = 'green' },
  ['edn'] =                  { icon = 'edn' ,    hl = 'green' },
  --
  ['cr'] =                   { icon = 'cr', hl = 'green' },
  --
  ['d'] =                    { icon = 'd', hl = 'purple' },
  --
  ['dart'] =                 { icon = 'dart' , hl = 'purple' },
  --
  ['djvu'] =                 { icon = 'djvu' , hl = 'purple' },
  --
  ['doc'] =                  { icon = 'doc',    hl = 'blue' },
  ['docx'] =                 { icon = 'docx',    hl = 'blue' },
  ['gdoc'] =                 { icon = 'gdoc',    hl = 'blue' },
  ['odt'] =                  { icon = 'odt',    hl = 'blue' },
  ['ebook'] =                { icon = 'book',    hl = 'orange' },
  ['mobi'] =                 { icon = 'mobi',    hl = 'red' },
  ['epub'] =                 { icon = 'epub',    hl = 'orange' },
  ['pdf'] =                  { icon = 'pdf',    hl = 'red' },
  --
  ['gslides'] =              { icon = 'slde',    hl = 'orange' },
  ['odp'] =                  { icon = 'ppt', hl = 'orange' },
  --
  ['xls'] =                  { icon = 'clx', hl = 'green' },
  ['tsv'] =                  { icon = 'clx', hl = 'green' },
  ['ods'] =                  { icon = 'clx', hl = 'green' },
  ['gsheet'] =               { icon = 'clx', hl = 'green' },
  ['xlsx'] =                 { icon = 'clx', hl = 'green' },
  ['csv'] =                  { icon = 'csv', hl = 'green' },
  ['gform'] =                { icon = 'form', hl = 'purple' },
  --
  ['docker-compose.yml'] =   { icon = 'dock',    hl = 'blue' },
  ['dockerfile'] =           { icon = 'dock', hl = 'blue' },
  --
  ['dropbox'] =              { icon = 'box' , hl = 'blue' },
  --
  ['ejs'] =                  { icon = 'ejs',    hl = 'blue' },
  --
  ['elm'] =                  { icon = 'elm' , hl  = 'green'},
  --
  ['erl'] =                  { icon = 'e',    hl = 'blue' },
  ['hrl'] =                  { icon = 'Erlang' , hl  = 'red'},
  --
  ['f#'] =                   { icon = 'f#',    hl = 'red' },
  ['fs'] =                   { icon = 'fs' , hl  = 'red'},
  ['fsi'] =                  { icon = 'fsi' , hl  = 'red'},
  ['fsscript'] =             { icon = 'fss' , hl  = 'red'},
  ['fsx'] =                  { icon = 'fsx' , hl  = 'red'},
  --
  ['go'] =                   { icon = 'go',    hl = 'red' },
  ['go.mod'] =               { icon = 'gmod' , hl  = 'red'},
  ['go.sum'] =               { icon = 'gsum' , hl  = 'red'},
  --
  ['gradle'] =               { icon = 'g',    hl = 'red' },
  ['jad'] =                  { icon = 'jad' , hl = 'red' },
  ['war'] =                  { icon = 'war' , hl = 'red' },
  ['jar'] =                  { icon = 'jar' , hl = 'red' },
  ['java'] =                 { icon = 'java', hl = 'red' },
  ['class'] =                { icon = 'clas' , hl  = 'red'},
  ['jl'] =                   { icon = 'jl' , hl  = 'red'},
  --
  ['groovy'] =               { icon = 'g', hl  = 'blue' },
  ['hs'] =                   { icon = 'h',    hl = 'red' },
  ['lhs'] =                  { icon = 'Haskall', hl  = 'purple' },
  --
  ['hxx'] =                  { icon = 'hxx', hl = 'purple' },
  ['hh'] =                   { icon = 'hh', hl  = 'purple' },
  ['hpp'] =                  { icon = 'hpp', hl  = 'purple' },
  --
  ['py'] =                   { icon = 'py',   hl = 'yellow' },
  ['ipynb'] =                { icon = 'py',   hl = 'yellow' },
  ['pyc'] =                  { icon = 'py',   hl = 'yellow' },
  ['pyd'] =                  { icon = 'py',   hl = 'yellow' },
  ['pyo'] =                  { icon = 'py',   hl = 'yellow' },
  ['requirements.txt'] =     { icon = 'i',    hl = 'white' },
  --
  ['eex'] =                  { icon = 'eex',  hl = 'purple' },
  ['ex'] =                   { icon = 'ex',   hl = 'purple' },
  ['exs'] =                  { icon = 'exs',  hl = 'purple' },
  ['leex'] =                 { icon = 'leex', hl = 'purple' },
  ['mix.lock'] =             { icon = 'lock', hl = 'purple' },
  --
  ['license'] =              { icon = 'l',    hl = 'white' },
  ['lock'] =                 { icon = 'l',    hl = 'white' },
  --
  ['lua'] =                  { icon = 'lua',  hl = 'blue' },
  --
  ['jmd'] =                  { icon = 'md',   hl = 'orange' },
  ['markdown'] =             { icon = 'md',   hl = 'orange' },
  ['md'] =                   { icon = 'md',   hl = 'orange' },
  ['mdx'] =                  { icon = 'md',   hl = 'orange' },
  ['mkd'] =                  { icon = 'md',   hl = 'orange' },
  ['rdoc'] =                 { icon = 'md',   hl = 'orange' },
  --
  ['ml'] =                   { icon = 'm',    hl = 'purple' },
  ['mli'] =                  { icon = 'ML' , hl = 'purple' },
  --
  ['part'] =                 { icon = 'part', hl = 'brightGray' },
  ['temp'] =                 { icon = 'temp', hl = 'brightGray' },
  ['tmp'] =                  { icon = 'tmp',  hl = 'brightGray' },
  --
  ['pp'] =                   { icon = 'p' ,   hl = 'green' },
  ['procfile'] =             { icon = 'k',    hl = 'green' },
  --
  ['razor'] =                { icon = 'r' ,   hl = 'red' },
  ['cshtml'] =               { icon = 'Razor' ,   hl = 'red' },
  --
  ['r'] =                    { icon = 'r',    hl = 'red' },
  ['rdata'] =                { icon = 'R' ,   hl = 'red' },
  ['rdb'] =                  { icon = 'R' ,   hl = 'red' },
  ['rds'] =                  { icon = 'R' ,   hl = 'red' },
  --
  ['rlib'] =                 { icon = 'r',    hl = 'blue' },
  ['rs'] =                   { icon = 'r',    hl = 'orange' },
  --
  ['rpm'] =                  { icon = 'r' ,   hl = 'red' },
  --
  ['.rvm'] =                 { icon = 'rb',   hl = 'red' },
  ['config.ru'] =            { icon = 'rb' ,   hl = 'red' },
  ['gem'] =                  { icon = 'rb' ,   hl = 'red' },
  ['gemfile'] =              { icon = 'rb' ,   hl = 'red' },
  ['gemspec'] =              { icon = 'rb' ,   hl = 'red' },
  ['guardfile'] =            { icon = 'rb' ,   hl = 'red' },
  ['rake'] =                 { icon = 'rb' ,   hl = 'red' },
  ['rakefile'] =             { icon = 'rb' ,   hl = 'red' },
  ['rb'] =                   { icon = 'rb' ,   hl = 'red' },
  ['rspec'] =                { icon = 'rb' ,   hl = 'red' },
  ['rspec_parallel'] =       { icon = 'rb' ,   hl = 'red' },
  ['rspec_status'] =         { icon = 'rb' ,   hl = 'red' },
  ['ru'] =                   { icon = 'rb' ,   hl = 'red' },
  --
  ['rubydoc'] =              { icon = 'rb',   hl = 'green' },
  ['erb'] =                  { icon = 'rail' ,  hl = 'green' },
  ['slim'] =                 { icon = 'rail'  , hl = 'green' },
  ['rss'] =                  { icon = 'rss', hl = 'red' },
  ['scala'] =                { icon = 'db',  hl = 'blue' },
  ['sqlite3'] =              { icon = 'db',  hl = 'green' },
  ['sql'] =                  { icon = 'db',  hl = 'red' },
  ['dump'] =                 { icon = 'db',  hl = 'red' },
  ['db'] =                   { icon = 'db',  hl = 'red' },
  ['pl'] =                   { icon = 'tor', hl = 'purple' },
  ['plx'] =                  { icon = 'tor', hl = 'purple' },
  ['pm'] =                   { icon = 'tor', hl = 'purple' },
  ['pod'] =                  { icon = 'tor', hl = 'purple' },
  ['t'] =                    { icon = 'tor', hl = 'purple' },
  --
  ['cls'] =                  { icon = 'cls',  hl = 'red' },
  ['latex'] =                { icon = 'tex',  hl = 'blue' },
  ['tex'] =                  { icon = 'tex',  hl = 'blue' },
  ['sty'] =                  { icon = 'sty',  hl = 'red' },
  ['bib'] =                  { icon = 'bib',  hl = 'green' },
  ['twig'] =                 { icon = 'twig', hl = 'red' },
  --
  ['log'] =                  { icon = 'log',  hl = 'white' },
  --
  ['eot'] =                  { icon = 'font', hl = 'red' },
  ['font'] =                 { icon = 'font',  hl = 'red' },
  ['otf'] =                  { icon = 'otf',   hl = 'red' },
  ['ttf'] =                  { icon = 'ttf',   hl = 'red' },
  ['woff'] =                 { icon = 'woff',  hl = 'red' },
  ['woff2'] =                { icon = 'woff',  hl = 'red' },
  --
  ['avif'] =                 { icon = 'img',  hl = 'purple' },
  ['bmp'] =                  { icon = 'img',  hl = 'purple' },
  ['gif'] =                  { icon = 'img',  hl = 'purple' },
  ['image'] =                { icon = 'img',  hl = 'purple' },
  ['j2c'] =                  { icon = 'img',  hl = 'purple' },
  ['j2k'] =                  { icon = 'img',  hl = 'purple' },
  ['jfi'] =                  { icon = 'img',  hl = 'purple' },
  ['jfif'] =                 { icon = 'img',  hl = 'purple' },
  ['jif'] =                  { icon = 'img',  hl = 'purple' },
  ['jp2'] =                  { icon = 'jpg',  hl = 'purple' },
  ['jpe'] =                  { icon = 'jpg',  hl = 'purple' },
  ['jpeg'] =                 { icon = 'jpg',  hl = 'purple' },
  ['jpg'] =                  { icon = 'jpg',  hl = 'purple' },
  ['jpx'] =                  { icon = 'jpg',  hl = 'purple' },
  ['jxl'] =                  { icon = 'jpg',  hl = 'purple' },
  ['png'] =                  { icon = 'png',  hl = 'purple' },
  ['pxm'] =                  { icon = 'png',  hl = 'purple' },
  ['tiff'] =                 { icon = 'tiff', hl = 'purple' },
  ['webp'] =                 { icon = 'webp', hl = 'purple' },
  ['svg'] =                  { icon = 'svg',   hl = 'purple' },
  ['ico'] =                  { icon = 'ico',  hl = 'yellow' },
  ['favicon.ico'] =          { icon = 'ico',  hl = 'yellow' },
  ['favicon.svg'] =          { icon = 'svg',  hl = 'yellow' },
  --
  ['flac'] =                 { icon = 'aud',  hl = 'red'    },
  ['m4a'] =                  { icon = 'aud' ,  hl = 'red'   },
  ['mp3'] =                  { icon = 'aud', hl = 'red'     },
  ['ogg'] =                  { icon = 'aud', hl = 'red'     },
  ['wav'] =                  { icon = 'aud', hl = 'red'     },
  ['avi'] =                  { icon = 'vid',  hl = 'purple' },
  ['flv'] =                  { icon = 'vid',  hl = 'purple' },
  ['mkv'] =                  { icon = 'vid',  hl = 'purple' },
  ['mov'] =                  { icon = 'vid',  hl = 'purple' },
  ['mp4'] =                  { icon = 'vid',  hl = 'purple' },
  ['ogv'] =                  { icon = 'vid',  hl = 'purple' },
  ['video'] =                { icon = 'vid',  hl = 'purple' },
  ['webm'] =                 { icon = 'vid',  hl = 'purple' },
  --
  ['xml'] =                  { icon = 'xml',  hl = 'green' },
  ['xul'] =                  { icon = 'xml',  hl = 'green' },
  --
  ['yarn.lock'] =            { icon = 'yml',  hl = 'cyan'   },
  ['yaml'] =                 { icon = 'yml',  hl = 'purple' },
  ['.clangd'] =              { icon = 'yml',  hl = 'purple' },
  ['.clang-format'] =        { icon = 'yml',  hl = 'purple' },
  ['yml'] =                  { icon = 'yml',  hl = 'purple' },
  --
  ['bz'] =                   { icon = 'bz',   hl = 'brightGray' },
  ['bz2'] =                  { icon = 'bz2',  hl = 'brightGray' },
  ['cpio'] =                 { icon = 'cpio', hl = 'brightGray' },
  ['gz'] =                   { icon = 'gz',   hl = 'brightGray' },
  ['lz'] =                   { icon = 'lz',   hl = 'brightGray' },
  ['lz4'] =                  { icon = 'lz4',  hl = 'brightGray' },
  ['lzh'] =                  { icon = 'lzh',  hl = 'brightGray' },
  ['lzma'] =                 { icon = 'lzma', hl = 'brightGray' },
  ['lzo'] =                  { icon = 'lzo',  hl = 'brightGray' },
  ['rar'] =                  { icon = 'rar',  hl = 'brightGray' },
  ['tar'] =                  { icon = 'tar',  hl = 'brightGray' },
  ['taz'] =                  { icon = 'taz',  hl = 'brightGray' },
  ['tbz'] =                  { icon = 'tbz',  hl = 'brightGray' },
  ['tbz2'] =                 { icon = 'tbz2', hl = 'brightGray' },
  ['tgz'] =                  { icon = 'tgz',  hl = 'brightGray' },
  ['tlz'] =                  { icon = 'tlz',  hl = 'brightGray' },
  ['txz'] =                  { icon = 'txz',  hl = 'brightGray' },
  ['tz'] =                   { icon = 'tz',   hl = 'brightGray' },
  ['tzo'] =                  { icon = 'tzo',  hl = 'brightGray' },
  ['xz'] =                   { icon = 'xz',   hl = 'brightGray' },
  ['zip'] =                  { icon = 'zip',  hl = 'brightGray' },
  ['zst'] =                  { icon = 'zst',  hl = 'brightGray' },
}

-- ---@param line string
-- local function get_extension(line)
--   -- Returns "Makefile" if the line is just "Makefile"
--   local try = string.match(line, "%.([^%.]+)$") or line
--   if string.match(line, "[^%a%d%.-_]") then return "" end
--   return try
-- end

M = {}

M._loaded = false;
M.has_loaded = function() return M._loaded end

M.setup = function()
  if M._loaded then return end
  for name, table in pairs(colors) do
    vim.api.nvim_set_hl(0, 'devicons_' .. name, table)
  end
  M._loaded = true
end

M.get_icon = function(name, ext, opts)
  if ext ~= nil then return '', 'none' end
  if icon_table[name] then return icon_table[name].icon, 'devicons_' .. icon_table[name].hl end
  local compound_ext = name:match '%.(.*)'
  local last_ext = name:match '%.([^.]*)$'
  local existing = icon_table[compound_ext] or icon_table[last_ext]
  if existing then return existing.icon, 'devicons_' .. existing.hl end
  return '', 'none'
end

return M

-- local separator = '  '
-- local max_size = 4

-- ---@param bufnr number
-- local function embelish (bufnr)
--   local namespace = vim.api.nvim_create_namespace("netrw")
--   local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
--   for i, line in ipairs(lines) do
--     local opts = {
--       id = i,
--       virt_text_pos = 'inline'
--     }
--     local icon_data = get_icon(line)
--     opts.virt_text = {{ icon_data.symbol .. string.rep(' ', max_size - #icon_data.symbol) .. separator, "netrw_" .. icon_data.hl }}
--     vim.api.nvim_buf_set_extmark(bufnr, namespace, i - 1, 0, opts)
--   end
--   -- Fixes weird case where the cursor spawns inside of the sign column.
--   vim.cmd([[norm lh]])
-- end

-- vim.api.nvim_create_autocmd("BufModifiedSet", {
--   pattern = { "*" },
--   callback = function()
--     if not (vim.bo and vim.bo.filetype == "netrw") then
--       return
--     end
--     if vim.b.netrw_liststyle ~= 0 and vim.b.netrw_liststyle ~= 1 then
--       return
--     end
--     local bufnr = vim.api.nvim_get_current_buf()
--     embelish(bufnr)
--   end,
--   group = vim.api.nvim_create_augroup("netrw", { clear = false }),
-- })


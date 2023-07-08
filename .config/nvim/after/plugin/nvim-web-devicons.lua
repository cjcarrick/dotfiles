local webdev = require 'nvim-web-devicons'

local bg = '0'
local bgBright = '8'

local fg = "7"
local fgBright = "15"

local red = '1'
local brightRed = '9'

local yellow = '3'
local brightYellow = '11'

local green = '2'
local brightGreen = '10'

local blue = '4'

local purple = '5'
local pink = '13'

local cyan = '14'
local orange = '6'

local icons = {
  ['txt'] =                  { name = 'Text',            icon = ' ', cterm_color = fg },
  --
  ['sh'] =                   { name = 'Sh',              icon = 's', cterm_color = orange },
  ['shell'] =                { name = 'Sh',              icon = 's' },
  ['awk'] =                  { name = 'Sh',              icon = 's' },
  ['.bashprofile'] =         { name = 'Bash',            icon = 'b', cterm_color = orange },
  ['.bashrc'] =              { name = 'Bash',            icon = 'b' },
  ['bash'] =                 { name = 'Bash',            icon = 'b' },
  ['bash_history'] =         { name = 'Bash',            icon = 'b' },
  ['bash_profile'] =         { name = 'Bash',            icon = 'b' },
  ['bashrc'] =               { name = 'Bash',            icon = 'b' },
  ['bats'] =                 { name = 'Bash',            icon = 'b' },
  ['.zprofile'] =            { name = 'Zsh',             icon = 'z', cterm_color = green },
  ['.zshrc'] =               { name = 'Zsh',             icon = 'z' },
  ['zsh'] =                  { name = 'Zsh',             icon = 'z' },
  ['zsh-theme'] =            { name = 'Zsh',             icon = 'z' },
  ['zshrc'] =                { name = 'Zsh',             icon = 'z' },
  ['ksh'] =                  { name = 'Ksh',             icon = 'k', cterm_color = purple },
  ['fish'] =                 { name = 'Fish',            icon = 'f', cterm_color = blue },
  ['ps1'] =                  { name = 'WindowsSh',       icon = 'w', cterm_color = blue },
  ['mk'] =                   { name = 'WindowsSh',       icon = 'w' },
  ['csh'] =                  { name = 'WindowsSh',       icon = 'w' },
  ['cmd'] =                  { name = 'WindowsSh',       icon = 'w' },
  ['msi'] =                  { name = 'WindowsSh',       icon = 'w' },
  ['ini'] =                  { name = 'WindowsSh',       icon = 'w' },
  ['bat'] =                  { name = 'WindowsSh',       icon = 'w' },
  ['cab'] =                  { name = 'WindowsSh',       icon = 'w' },
  --
  ['cfg'] =                  { name = 'Config',          icon = 'c', cterm_color = fgBright },
  ['toml'] =                 { name = 'Config',          icon = 'c' },
  ['conf'] =                 { name = 'Config',          icon = 'c' },
  ['editorconfig'] =         { name = 'Config',          icon = 'c' },
  ['.env'] =                 { name = 'Config',          icon = 'c' },
  --
  ['img'] =                  { name = 'Disk',            icon = 'd', cterm_color = fg },
  ['iso'] =                  { name = 'Disk',            icon = 'd' },
  ['so'] =                   { name = 'Linux',           icon = 'l', cterm_color = blue },
  ['pkgbuild'] =             { name = 'Arch',            icon = 'a', cterm_color = blue },
  ['ebuild'] =               { name = 'Gentoo',          icon = 'g', cterm_color = purple },
  ['deb'] =                  { name = 'Debian',          icon = 'd', cterm_color = orange },
  ['android'] =              { name = 'Android',         icon = 'a', cterm_color = green },
  ['apk'] =                  { name = 'Android' },
  ['.DS_Store'] =            { name = 'Apple',           icon = 'a', cterm_color = fg },
  ['ds_store'] =             { name = 'Apple',           icon = 'a' },
  ['apple'] =                { name = 'Apple' },
  ['localized'] =            { name = 'Apple' },
  ['dll'] =                  { name = 'Windows',         icon = 'w', cterm_color = blue },
  ['exe'] =                  { name = 'Windows' },
  ['windows'] =              { name = 'Windows' },
  --
  ['/Trash.$'] =             { name = 'Trash',           icon = 't', cterm_color = fg },
  ['/.Trash-d+.$'] =         { name = 'Trash' },
  --
  ['.gitattributes'] =       { name = 'Git',             icon = 'g', cterm_color = orange },
  ['.gitconfig'] =           { name = 'Git',             icon = 'g' },
  ['.gitignore'] =           { name = 'Git',             icon = 'g' },
  ['.gitmodules'] =          { name = 'Git',             icon = 'g' },
  ['/.git.$'] =              { name = 'Git',             icon = 'g' },
  ['git'] =                  { name = 'Git',             icon = 'g' },
  ['gitattributes'] =        { name = 'Git',             icon = 'g' },
  ['gitmodules'] =           { name = 'Git' },
  ['diff'] =                 { name = 'Diff',            icon = 'd' },
  ['patch'] =                { name = 'Diff' },
  ['.gitlab-ci.yml'] =       { name = 'GitLab',          icon = 'g', cterm_color = red },
  --
  ['readme'] =               { name = 'Readme',          icon = 'i', cterm_color = blue },
  ['readme.*'] =             { name = 'Readme',          icon = 'i' },
  ['readme.md'] =            { name = 'Readme',          icon = 'i' },
  ['rmd'] =                  { name = 'Readme',          icon = 'i' },
  --
  ['.*vimrc.*'] =            { name = 'Vim',             icon = 'v', cterm_color = green },
  ['vim'] =                  { name = 'Vim' },
  ['.gvimrc'] =              { name = 'Vim' },
  ['.vimrc'] =               { name = 'Vim' },
  ['_gvimrc'] =              { name = 'Vim' },
  ['_vimrc'] =               { name = 'Vim' },
  ['/.atom.$'] =             { name = 'Atom',            icon = 'a' },
  ['iml'] =                  { name = 'Idea',            icon = 'i', cterm_color = blue },
  ['/.idea.$'] =             { name = 'Idea' },
  ['sln'] =                  { name = 'VisualStudio',    icon = 'v', cterm_color = blue },
  ['suo'] =                  { name = 'VisualStudio' },
  ['ai'] =                   { name = 'Illustrator',     icon = 'i', cterm_color = orange },
  ['psb'] =                  { name = 'Photoshop',       icon = 'p', cterm_color = blue },
  ['psd'] =                  { name = 'Photoshop',       icon = 'p' },
  --
  ['/include.$'] =           { name = '/include.$',      icon = 's' },
  --
  ['Vagrantfile$'] =         { name = 'Linode',          icon = 'l', cterm_color = green },
  --
  ['c'] =                    { name = 'C',               icon = 'c', cterm_color = blue },
  ['cuh'] =                  { name = 'H',               icon = 'h', cterm_color = fg },
  ['h'] =                    { name = 'H',               icon = 'h' },
  ['m'] =                    { name = 'M',               icon = 'm', cterm_color = blue },
  ['cmakelists.txt'] =       { name = 'Makefile',        icon = 'm', cterm_color = fg },
  ['makefile'] =             { name = 'Makefile',        icon = 'm' },
  --
  ['c++'] =                  { name = 'Cpp',             icon = 'x', cterm_color = blue },
  ['cc'] =                   { name = 'Cpp',             icon = 'x' },
  ['cp'] =                   { name = 'Cpp',             icon = 'x' },
  ['cpp'] =                  { name = 'Cpp',             icon = 'x' },
  ['cu'] =                   { name = 'Cpp',             icon = 'x' },
  ['cxx'] =                  { name = 'Cpp',             icon = 'x' },
  ['mm'] =                   { name = 'Cpp',             icon = 'x' },
  --
  ['csx'] =                  { name = 'CSharp',          icon = 's', cterm_color = blue },
  ['csproj'] =               { name = 'CSharp' },
  ['cs'] =                   { name = 'CSharp' },
  --
  ['swift'] =                { name = 'Swift',           icon = 's', cterm_color = orange },
  ['xcplayground'] =         { name = 'Swift' },
  --
  ['htm'] =                  { name = 'HTML',            icon = 'h', cterm_color = orange },
  ['html'] =                 { name = 'HTML',            icon = 'h' },
  ['xhtml'] =                { name = 'HTML',            icon = 'h' },
  ['haml'] =                 { name = 'Haml',            icon = 'h', cterm_color = pink },
  ['pug'] =                  { name = 'Pug',             icon = 'p', cterm_color = red },
  ['mustache'] =             { name = 'mustache' },
  ['hbs'] =                  { name = 'Mustache',        icon = 'm', cterm_color = red },
  ['vue'] =                  { name = 'Vue',             icon = 'v', cterm_color = green },
  ['svelte'] =               { name = 'Svelte',          icon = 's', cterm_color = orange },
  --
  ['php'] =                  { name = 'PHP',             icon = 'p' },
  --
  ['css'] =                  { name = 'CSS',             icon = 'c', cterm_color = blue },
  ['less'] =                 { name = 'less',            icon = 'l', cterm_color = blue },
  ['scss'] =                 { name = 'SCSS',            icon = 's', cterm_color = pink },
  ['sass'] =                 { name = 'SCSS',            icon = 's' },
  ['styl'] =                 { name = 'Stylus',          icon = 's', cterm_color = green },
  ['stylus'] =               { name = 'Stylus',          icon = 's' },
  ['cjs'] =                  { name = 'Javascript',      icon = 'j', cterm_color = yellow },
  ['mjs'] =                  { name = 'Javascript',      icon = 'j' },
  ['js'] =                   { name = 'Javascript',      icon = 'j' },
  ['jsx'] =                  { name = 'JavascriptReact', icon = 'r', cterm_color = blue },
  ['node'] =                 { name = 'Node',            icon = 'n', cterm_color = green },
  ['npmignore'] =            { name = 'NPM',             icon = 'n', cterm_color = red },
  ['.npmrc'] =               { name = 'NPM',             icon = 'n', cterm_color = red },
  --
  ['coffee'] =               { name = 'Coffee',          icon = 'c' },
  ['json'] =                 { name = 'JSON',            icon = 'j', cterm_color = yellow },
  ['avro'] =                 { name = 'JSON',            icon = 'j' },
  ['jsonc'] =                { name = 'JSON',            icon = 'j' },
  ['package.json'] =         { name = 'JSON',            icon = 'j' },
  ['properties'] =           { name = 'JSON',            icon = 'j' },
  ['webmanifest'] =          { name = 'JSON',            icon = 'j' },
  --
  ['ts'] =                   { name = 'Typescript',      icon = 't', cterm_color = blue },
  ['tsx'] =                  { name = 'TypescriptReact', icon = 'r', cterm_color = blue },
  ['tsconfig.*.json$'] =     { name = 'Tsconfig',        icon = 't', cterm_color = blue },
  ['tsconfig.json'] =        { name = 'Tsconfig',        icon = 't', cterm_color = blue },
  --
  ['.*materialize.*.css$'] = { name = 'Materialize',     icon = 'm', cterm_color = red },
  ['.*materialize.*.js$'] =  { name = 'Materialize' },
  --
  ['.*mootools.*.js$'] =     { name = 'Mootools',        icon = 'm' },
  ['.*require.*.js$'] =      { name = 'RequireJS',       icon = 'r' },
  ['.*angular.*.js$'] =      { name = 'Angular',         icon = 'a', cterm_color = red },
  ['.*backbone.*.js$'] =     { name = 'Backbone' },
  --
  ['gruntfile.coffee'] =     { name = 'Grunt',           icon = 'g', cterm_color = red },
  ['gruntfile.js'] =         { name = 'Grunt' },
  ['gruntfile.ls'] =         { name = 'Grunt' },
  ['gulpfile.coffee'] =      { name = 'Gulp',            icon = 'g', cterm_color = red },
  ['gulpfile.js'] =          { name = 'Gulp' },
  ['gulpfile.ls'] =          { name = 'Gulp' },
  --
  ['.eslintrc.cjs'] =        { name = 'Eslint',          icon = 'e', cterm_color = purple },
  ['.eslintrc.js'] =         { name = 'Eslint' },
  ['.eslintignore'] =        { name = 'EslintIgnore',    icon = 'e', cterm_color = fg },
  --
  ['.prettierignore'] =      { name = 'PrettierIgnore',  icon = 'p', cterm_color = fg },
  ['.prettierrc'] =          { name = 'Prettier',        icon = 'p', cterm_color = pink },
  --
  ['clj'] =                  { name = 'Clojure',         icon = '', cterm_color = green },
  ['cljc'] =                 { name = 'Clojure' },
  ['cljs'] =                 { name = 'Clojure' },
  ['edn'] =                  { name = 'Clojure' },
  --
  ['cr'] =                   { name = 'cr',              icon = 'c' },
  --
  ['d'] =                    { name = 'D',               icon = 'd' },
  --
  ['dart'] =                 { name = 'Dart',            icon = 'd' },
  --
  ['djvu'] =                 { name = 'djvu',            icon = 'd' },
  --
  ['doc'] =                  { name = 'Word',            icon = 'd', cterm_color = blue },
  ['docx'] =                 { name = 'Word',            icon = 'd', cterm_color = blue },
  ['gdoc'] =                 { name = 'Word',            icon = 'd', cterm_color = blue },
  ['odt'] =                  { name = 'Word',            icon = 'd', cterm_color = blue },
  ['ebook'] =                { name = 'EBook',           icon = 'b', cterm_color = orange },
  ['mobi'] =                 { name = 'EBook',           icon = 'b', cterm_color = red },
  ['epub'] =                 { name = 'EBook',           icon = 'b', cterm_color = red },
  ['pdf'] =                  { name = 'PDF',             icon = 'p', cterm_color = red },
  --
  ['gslides'] =              { name = 'PowerPoint',      icon = 's', cterm_color = orange },
  ['odp'] =                  { name = 'PowerPoint' },
  --
  ['xls'] =                  { name = 'Excel',           icon = 'x', cterm_color = green },
  ['tsv'] =                  { name = 'Excel' },
  ['ods'] =                  { name = 'Excel' },
  ['gsheet'] =               { name = 'Excel' },
  ['xlsx'] =                 { name = 'Excel' },
  ['csv'] =                  { name = 'CSV',             icon = 'c' },
  ['gform'] =                { name = 'gform',           icon = 'f' },
  --
  ['docker-compose.yml'] =   { name = 'Docker',          icon = 'd', cterm_color = blue },
  ['dockerfile'] =           { name = 'Docker' },
  --
  ['dropbox'] =              { name = 'DropBox',         icon = 'd' },
  --
  ['ejs'] =                  { name = 'ejs',             icon = 'e', cterm_color = blue },
  --
  ['elm'] =                  { name = 'elm',             icon = 'e' },
  --
  ['erl'] =                  { name = 'Erlang',          icon = 'e', cterm_color = blue },
  ['hrl'] =                  { name = 'Erlang' },
  --
  ['f#'] =                   { name = 'FSharp',          icon = 'f', cterm_color = red },
  ['fs'] =                   { name = 'FSharp' },
  ['fsi'] =                  { name = 'FSharp' },
  ['fsscript'] =             { name = 'FSharp' },
  ['fsx'] =                  { name = 'FSharp' },
  --
  ['go'] =                   { name = 'GoLang',          icon = 'g', cterm_color = red },
  ['go.mod'] =               { name = 'GoLang' },
  ['go.sum'] =               { name = 'GoLang' },
  --
  ['gradle'] =               { name = 'Java',            icon = 'g', cterm_color = red },
  ['jad'] =                  { name = 'Java' },
  ['war'] =                  { name = 'Java' },
  ['jar'] =                  { name = 'Java' },
  ['java'] =                 { name = 'Java' },
  ['class'] =                { name = 'Java',            cterm_color = blue },
  ['jl'] =                   { name = 'Java',            cterm_color = blue },
  --
  ['groovy'] =               { name = 'groovy',          icon = 'g' },
  ['hs'] =                   { name = 'Haskall',         icon = 'h', cterm_color = red },
  ['lhs'] =                  { name = 'Haskall' },
  --
  ['hxx'] =                  { name = 'Hxx',             icon = 'h' },
  ['hh'] =                   { name = 'Hxx' },
  ['hpp'] =                  { name = 'Hxx' },
  --
  ['py'] =                   { name = 'Python',          icon = 'p', cterm_color = yellow },
  ['ipynb'] =                { name = 'Python' },
  ['pyc'] =                  { name = 'Python' },
  ['pyd'] =                  { name = 'Python' },
  ['pyo'] =                  { name = 'Python' },
  ['requirements.txt'] =     { name = 'Requirements',    icon = 'i', cterm_color = fg },
  --
  ['eex'] =                  { name = 'Elixir',          icon = 'e', cterm_color = purple },
  ['ex'] =                   { name = 'Elixir' },
  ['exs'] =                  { name = 'Elixir' },
  ['leex'] =                 { name = 'Elixir' },
  ['mix.lock'] =             { name = 'Elixir' },
  --
  ['license'] =              { name = 'License',         icon = 'l', cterm_color = fg },
  ['lock'] =                 { name = 'lock',            icon = 'l', cterm_color = fg },
  --
  ['lua'] =                  { name = 'lua',             icon = 'l', cterm_color = blue },
  --
  ['jmd'] =                  { name = 'Markdown',        icon = 'm', cterm_color = orange },
  ['markdown'] =             { name = 'Markdown',        icon = 'm' },
  ['md'] =                   { name = 'Markdown',        icon = 'm' },
  ['mdx'] =                  { name = 'Markdown',        icon = 'm' },
  ['mkd'] =                  { name = 'Markdown',        icon = 'm' },
  ['rdoc'] =                 { name = 'Markdown',        icon = 'm' },
  --
  ['ml'] =                   { name = 'ML',              icon = 'm', cterm_color = purple },
  ['mli'] =                  { name = 'ML' },
  --
  ['part'] =                 { name = 'Temp',            icon = 't', cterm_color = fg },
  ['temp'] =                 { name = 'Temp' },
  ['tmp'] =                  { name = 'Temp' },
  --
  ['pp'] =                   { name = 'pp',              icon = 'p' },
  ['procfile'] =             { name = 'Kotkin',          icon = 'k', cterm_color = green },
  --
  ['razor'] =                { name = 'Razor',           icon = 'r' },
  ['cshtml'] =               { name = 'Razor' },
  --
  ['r'] =                    { name = 'R',               icon = 'r', cterm_color = red },
  ['rdata'] =                { name = 'R' },
  ['rdb'] =                  { name = 'R' },
  ['rds'] =                  { name = 'R' },
  --
  ['rlib'] =                 { name = 'Rlib',            icon = 'r', cterm_color = blue },
  ['rs'] =                   { name = 'Rust',            icon = 'r', cterm_color = orange },
  --
  ['rpm'] =                  { name = 'rpm',             icon = 'r' },
  --
  ['.rvm'] =                 { name = 'Ruby',            icon = '', cterm_color = red },
  ['config.ru'] =            { name = 'Ruby' },
  ['gem'] =                  { name = 'Ruby' },
  ['gemfile'] =              { name = 'Ruby' },
  ['gemspec'] =              { name = 'Ruby' },
  ['guardfile'] =            { name = 'Ruby' },
  ['rake'] =                 { name = 'Ruby' },
  ['rakefile'] =             { name = 'Ruby' },
  ['rb'] =                   { name = 'Ruby' },
  ['rspec'] =                { name = 'Ruby' },
  ['rspec_parallel'] =       { name = 'Ruby' },
  ['rspec_status'] =         { name = 'Ruby' },
  ['ru'] =                   { name = 'Ruby' },
  --
  ['rubydoc'] =              { name = 'Rails',           icon = 'r', cterm_color = green },
  ['erb'] =                  { name = 'Rails' },
  ['slim'] =                 { name = 'Rails' },
  ['rss'] =                  { name = 'rss',             icon = 'r', cterm_color = red },
  ['scala'] =                { name = 'scala',           icon = 'd', cterm_color = blue },
  ['sqlite3'] =              { name = 'SQL',             icon = 'd', cterm_color = green },
  ['sql'] =                  { name = 'DB',              icon = 'd', cterm_color = red },
  ['dump'] =                 { name = 'DB' },
  ['db'] =                   { name = 'DB' },
  ['pl'] =                   { name = 'Tor',             icon = 't', cterm_color = purple },
  ['plx'] =                  { name = 'Tor' },
  ['pm'] =                   { name = 'Tor' },
  ['pod'] =                  { name = 'Tor' },
  ['t'] =                    { name = 'Tor' },
  --
  ['cls'] =                  { name = 'Latex',           icon = 't', cterm_color = red },
  ['latex'] =                { name = 'Latex',           icon = 't', cterm_color = blue },
  ['tex'] =                  { name = 'Latex',           icon = 't', cterm_color = blue },
  ['sty'] =                  { name = 'Latex',           icon = 't', cterm_color = red },
  ['bib'] =                  { name = 'Bibtex',          icon = 't', cterm_color = green },
  ['twig'] =                 { name = 'twig',            icon = '', cterm_color = red },
  --
  ['log'] =                  { name = 'Log',             icon = 't', cterm_color = fg },
  --
  ['eot'] =                  { name = 'Font',            icon = 'f', cterm_color = red },
  ['font'] =                 { name = 'Font',            icon = 'f',                   },
  ['otf'] =                  { name = 'Font',            icon = 'f',                   },
  ['ttf'] =                  { name = 'Font',            icon = 'f',                   },
  ['woff'] =                 { name = 'Font',            icon = 'f',                   },
  ['woff2'] =                { name = 'Font',            icon = 'f',                   },
  --
  ['avif'] =                 { name = 'Image',           icon = 'i', cterm_color = purple },
  ['bmp'] =                  { name = 'Image',           icon = 'i',                      },
  ['gif'] =                  { name = 'Image',           icon = 'i',                      },
  ['ico'] =                  { name = 'Image',           icon = 'i',                      },
  ['image'] =                { name = 'Image',           icon = 'i',                      },
  ['j2c'] =                  { name = 'Image',           icon = 'i',                      },
  ['j2k'] =                  { name = 'Image',           icon = 'i',                      },
  ['jfi'] =                  { name = 'Image',           icon = 'i',                      },
  ['jfif'] =                 { name = 'Image',           icon = 'i',                      },
  ['jif'] =                  { name = 'Image',           icon = 'i',                      },
  ['jp2'] =                  { name = 'Image',           icon = 'i',                      },
  ['jpe'] =                  { name = 'Image',           icon = 'i',                      },
  ['jpeg'] =                 { name = 'Image',           icon = 'i',                      },
  ['jpg'] =                  { name = 'Image',           icon = 'i',                      },
  ['jpx'] =                  { name = 'Image',           icon = 'i',                      },
  ['jxl'] =                  { name = 'Image',           icon = 'i',                      },
  ['png'] =                  { name = 'Image',           icon = 'i',                      },
  ['pxm'] =                  { name = 'Image',           icon = 'i',                      },
  ['tiff'] =                 { name = 'Image',           icon = 'i',                      },
  ['webp'] =                 { name = 'Image',           icon = 'i',                      },
  ['svg'] =                  { name = 'Vector',          icon = 'v',                      },
  ['favicon.ico'] =          { name = 'Favicon',         icon = 'f', cterm_color = yellow },
  ['favicon.svg'] =          { name = 'Favicon',         icon = 'f',                      },
  --
  ['flac'] =                 { name = 'Audio',           icon = 'a', cterm_color = red    },
  ['m4a'] =                  { name = 'Audio',           icon = 'a'                       },
  ['mp3'] =                  { name = 'Audio',           icon = 'a'                       },
  ['ogg'] =                  { name = 'Audio',           icon = 'a'                       },
  ['wav'] =                  { name = 'Audio',           icon = 'a'                       },
  ['avi'] =                  { name = 'Video',           icon = 'v', cterm_color = purple },
  ['flv'] =                  { name = 'Video',           icon = 'v'                       },
  ['mkv'] =                  { name = 'Video',           icon = 'v'                       },
  ['mov'] =                  { name = 'Video',           icon = 'v'                       },
  ['mp4'] =                  { name = 'Video',           icon = 'v'                       },
  ['ogv'] =                  { name = 'Video',           icon = 'v'                       },
  ['video'] =                { name = 'Video',           icon = 'v'                       },
  ['webm'] =                 { name = 'Video',           icon = 'v'                       },
  --
  ['xml'] =                  { name = 'XML',             icon = 'x', cterm_color = green },
  ['xul'] =                  { name = 'XML' },
  --
  ['yarn.lock'] =            { name = 'Yarn',            icon = '๋y', cterm_color = cyan   },
  ['yaml'] =                 { name = 'Yaml',            icon = 'y', cterm_color = purple },
  ['.clangd'] =              { name = 'Yaml',            icon = 'y',                      },
  ['.clang-format'] =        { name = 'Yaml',            icon = 'y',                      },
  ['yml'] =                  { name = 'Yaml',            icon = 'y',                      },
  --
  ['bz'] =                   { name = 'Archive',         icon = 'z', cterm_color = fg },
  ['bz2'] =                  { name = 'Archive',         icon = 'z' },
  ['cpio'] =                 { name = 'Archive',         icon = 'z' },
  ['gz'] =                   { name = 'Archive',         icon = 'z' },
  ['lz'] =                   { name = 'Archive',         icon = 'z' },
  ['lz4'] =                  { name = 'Archive',         icon = 'z' },
  ['lzh'] =                  { name = 'Archive',         icon = 'z' },
  ['lzma'] =                 { name = 'Archive',         icon = 'z' },
  ['lzo'] =                  { name = 'Archive',         icon = 'z' },
  ['rar'] =                  { name = 'Archive',         icon = 'z' },
  ['tar'] =                  { name = 'Archive',         icon = 'z' },
  ['taz'] =                  { name = 'Archive',         icon = 'z' },
  ['tbz'] =                  { name = 'Archive',         icon = 'z' },
  ['tbz2'] =                 { name = 'Archive',         icon = 'z' },
  ['tgz'] =                  { name = 'Archive',         icon = 'z' },
  ['tlz'] =                  { name = 'Archive',         icon = 'z' },
  ['txz'] =                  { name = 'Archive',         icon = 'z' },
  ['tz'] =                   { name = 'Archive',         icon = 'z' },
  ['tzo'] =                  { name = 'Archive',         icon = 'z' },
  ['xz'] =                   { name = 'Archive',         icon = 'z' },
  ['zip'] =                  { name = 'Archive',         icon = 'z' },
  ['zst'] =                  { name = 'Archive',         icon = 'z' },
}

if webdev.has_loaded then
  webdev.set_icon(icons)
  webdev.set_default_icon(' ', '#ffffff', fg)
else
  webdev.setup {
    override = icons,
    default = false,
  }
end

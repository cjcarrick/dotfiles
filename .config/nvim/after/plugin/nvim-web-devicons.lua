local webdev = require 'nvim-web-devicons'

local bg = '0'
local bgBright = '8'

local fg = '7'
local fgBright = '15'

local red = '1'
local brightRed = '9'

local yellow = '3'
local brightYellow = '11'

local green = '2'
local brightGreen = '10'

local blue = '4'

local purple = '5'
local pink = '13'

local cyan = '6'
local orange = '14'

local icons = {
      ['txt'] = { name = 'Text', icon = '', cterm_color = fg },
  --
      ['sh'] = { name = 'Sh', icon = '', cterm_color = orange },
      ['shell'] = { name = 'Sh', icon = '' },
      ['awk'] = { name = 'Sh', icon = '' },
      ['.bashprofile'] = { name = 'Bash', icon = '', cterm_color = orange },
      ['.bashrc'] = { name = 'Bash', icon = '' },
      ['bash'] = { name = 'Bash', icon = '' },
      ['bash_history'] = { name = 'Bash', icon = '' },
      ['bash_profile'] = { name = 'Bash', icon = '' },
      ['bashrc'] = { name = 'Bash', icon = '' },
      ['bats'] = { name = 'Bash', icon = '' },
      ['.zprofile'] = { name = 'Zsh', icon = '', cterm_color = green },
      ['.zshrc'] = { name = 'Zsh', icon = '' },
      ['zsh'] = { name = 'Zsh', icon = '' },
      ['zsh-theme'] = { name = 'Zsh', icon = '' },
      ['zshrc'] = { name = 'Zsh', icon = '' },
      ['ksh'] = { name = 'Ksh', icon = '', cterm_color = purple },
      ['fish'] = { name = 'Fish', icon = '', cterm_color = blue },
      ['ps1'] = { name = 'WindowsSh', icon = '', cterm_color = blue },
      ['mk'] = { name = 'WindowsSh', icon = '' },
      ['csh'] = { name = 'WindowsSh', icon = '' },
      ['cmd'] = { name = 'WindowsSh', icon = '' },
      ['msi'] = { name = 'WindowsSh', icon = '' },
      ['ini'] = { name = 'WindowsSh', icon = '' },
      ['bat'] = { name = 'WindowsSh', icon = '' },
      ['cab'] = { name = 'WindowsSh', icon = '' },
  --
      ['cfg'] = { name = 'Config', icon = '' },
      ['toml'] = { name = 'Config', icon = '' },
      ['conf'] = { name = 'Config', icon = '' },
      ['editorconfig'] = { name = 'Config', icon = '' },
      ['.env'] = { name = 'Config', icon = '' },
  --
      ['img'] = { name = 'Disk', icon = '', cterm_color = fg },
      ['iso'] = { name = 'Disk' },
      ['so'] = { name = 'Linux', icon = '', cterm_color = blue },
      ['pkgbuild'] = { name = 'Arch', icon = '', cterm_color = blue },
      ['ebuild'] = { name = 'Gentoo', icon = '', cterm_color = purple },
      ['deb'] = { name = 'Debian', icon = '', cterm_color = orange },
      ['android'] = { name = 'Android', icon = '', cterm_color = green },
      ['apk'] = { name = 'Android' },
      ['.DS_Store'] = { name = 'Apple', icon = '', cterm_color = fg },
      ['ds_store'] = { name = 'Apple', icon = '' },
      ['apple'] = { name = 'Apple' },
      ['localized'] = { name = 'Apple' },
      ['dll'] = { name = 'Windows', icon = '', cterm_color = blue },
      ['exe'] = { name = 'Windows' },
      ['windows'] = { name = 'Windows' },
  --
      ['/Trash.$'] = { name = 'Trash', icon = '', cterm_color = fg },
      ['/.Trash-d+.$'] = { name = 'Trash' },
  --
      ['.gitattributes'] = { name = 'Git', icon = '', cterm_color = fg },
      ['.gitconfig'] = { name = 'Git', icon = '' },
      ['.gitignore'] = { name = 'Git', icon = '' },
      ['.gitmodules'] = { name = 'Git', icon = '' },
      ['/.git.$'] = { name = 'Git', icon = '' },
      ['git'] = { name = 'Git', icon = '' },
      ['gitattributes'] = { name = 'Git', icon = '' },
      ['gitmodules'] = { name = 'Git' },
      ['diff'] = { name = 'Diff', icon = '' },
      ['patch'] = { name = 'Diff' },
      ['.gitlab-ci.yml'] = { name = 'GitLab', icon = '', cterm_color = red },
  --
      ['readme'] = { name = 'Readme', icon = '', cterm_color = blue },
      ['readme.*'] = { name = 'Readme', icon = '' },
      ['readme.md'] = { name = 'Readme', icon = '' },
      ['rmd'] = { name = 'Readme', icon = '' },
  --
      ['.*vimrc.*'] = { name = 'Vim', icon = '', cterm_color = green },
      ['vim'] = { name = 'Vim' },
      ['.gvimrc'] = { name = 'Vim' },
      ['.vimrc'] = { name = 'Vim' },
      ['_gvimrc'] = { name = 'Vim' },
      ['_vimrc'] = { name = 'Vim' },
      ['/.atom.$'] = { name = 'Atom', icon = '' },
      ['iml'] = { name = 'Idea', icon = '', cterm_color = blue },
      ['/.idea.$'] = { name = 'Idea' },
      ['sln'] = { name = 'VisualStudio', icon = '', cterm_color = blue },
      ['suo'] = { name = 'VisualStudio' },
      ['ai'] = { name = 'Illustrator', icon = '', cterm_color = orange },
      ['psb'] = { name = 'Photoshop', icon = '', cterm_color = blue },
      ['psd'] = { name = 'Photoshop', icon = '' },
  --
      ['/include.$'] = { name = '/include.$', icon = '' },
  --
      ['Vagrantfile$'] = { name = 'Linode', icon = '', cterm_color = green },
  --
      ['c'] = { name = 'C', icon = '', cterm_color = blue },
      ['cuh'] = { name = 'H', icon = '', cterm_color = purple },
      ['h'] = { name = 'H', icon = '' },
      ['m'] = { name = 'M', icon = '', cterm_color = blue },
      ['cmakelists.txt'] = { name = 'Makefile', icon = '', cterm_color = fg },
      ['makefile'] = { name = 'Makefile', icon = '' },
  --
      ['c++'] = { name = 'Cpp', icon = '', cterm_color = blue },
      ['cc'] = { name = 'Cpp', icon = '' },
      ['cp'] = { name = 'Cpp', icon = '' },
      ['cpp'] = { name = 'Cpp', icon = '' },
      ['cu'] = { name = 'Cpp', icon = '' },
      ['cxx'] = { name = 'Cpp', icon = '' },
      ['mm'] = { name = 'Cpp', icon = '' },
  --
      ['csx'] = { name = 'CSharp', icon = '', cterm_color = blue },
      ['csproj'] = { name = 'CSharp' },
      ['cs'] = { name = 'CSharp' },
  --
      ['swift'] = { name = 'Swift', icon = '', cterm_color = orange },
      ['xcplayground'] = { name = 'Swift' },
  --
      ['htm'] = { name = 'HTML', icon = '', cterm_color = orange },
      ['html'] = { name = 'HTML', icon = '' },
      ['xhtml'] = { name = 'HTML', icon = '' },
      ['haml'] = { name = 'Haml', icon = '', cterm_color = pink },
      ['pug'] = { name = 'Pug', icon = '', cterm_color = red },
      ['mustache'] = { name = 'mustache' },
      ['hbs'] = { name = 'Mustache', icon = '', cterm_color = red },
      ['vue'] = { name = 'Vue', icon = '', cterm_color = green },
      ['svelte'] = { name = 'Svelte', icon = '', cterm_color = orange },
  --
      ['php'] = { name = 'PHP', icon = '' },
  --
      ['css'] = { name = 'CSS', icon = '', cterm_color = blue },
      ['less'] = { name = 'less', icon = '', cterm_color = blue },
      ['scss'] = { name = 'SCSS', icon = '', cterm_color = pink },
      ['sass'] = { name = 'SCSS', icon = '' },
      ['styl'] = { name = 'Stylus', icon = '', cterm_color = green },
      ['stylus'] = { name = 'Stylus', icon = '' },
      ['cjs'] = { name = 'Javascript', icon = '', cterm_color = yellow },
      ['mjs'] = { name = 'Javascript', icon = '' },
      ['js'] = { name = 'Javascript', icon = '' },
      ['jsx'] = { name = 'JavascriptReact', icon = '', cterm_color = blue },
      ['node'] = { name = 'Node', icon = '', cterm_color = green },
      ['npmignore'] = { name = 'NPM', icon = '', cterm_color = red },
      ['.npmrc'] = { name = 'NPM', icon = '', cterm_color = red },
  --
      ['coffee'] = { name = 'Coffee', icon = '' },
      ['json'] = { name = 'JSON', icon = '', cterm_color = yellow },
      ['avro'] = { name = 'JSON', icon = '' },
      ['jsonc'] = { name = 'JSON', icon = '' },
      ['package.json'] = { name = 'JSON', icon = '' },
      ['properties'] = { name = 'JSON', icon = '' },
      ['webmanifest'] = { name = 'JSON', icon = '' },
  --
      ['ts'] = { name = 'Typescript', icon = '', cterm_color = blue },
      ['tsx'] = { name = 'TypescriptReact', icon = '', cterm_color = blue },
      ['tsconfig.*.json$'] = { name = 'Tsconfig', icon = '', cterm_color = blue },
      ['tsconfig.json'] = { name = 'Tsconfig', icon = '' },
  --
      ['.*materialize.*.css$'] = { name = 'Materialize', icon = '', cterm_color = red },
      ['.*materialize.*.js$'] = { name = 'Materialize' },
  --
      ['.*mootools.*.js$'] = { name = 'Mootools', icon = '' },
      ['.*require.*.js$'] = { name = 'RequireJS', icon = '' },
      ['.*angular.*.js$'] = { name = 'Angular', icon = '', cterm_color = red },
      ['.*backbone.*.js$'] = { name = 'Backbone' },
  --
      ['gruntfile.coffee'] = { name = 'Grunt', icon = '', cterm_color = red },
      ['gruntfile.js'] = { name = 'Grunt' },
      ['gruntfile.ls'] = { name = 'Grunt' },
      ['gulpfile.coffee'] = { name = 'Gulp', icon = '', cterm_color = red },
      ['gulpfile.js'] = { name = 'Gulp' },
      ['gulpfile.ls'] = { name = 'Gulp' },
  --
      ['.eslintrc.cjs'] = { name = 'Eslint', icon = '', cterm_color = purple },
      ['.eslintrc.js'] = { name = 'Eslint' },
      ['.eslintignore'] = { name = 'EslintIgnore', icon = '', cterm_color = fg },
  --
      ['.prettierignore'] = { name = 'PrettierIgnore', icon = 'P', cterm_color = fg },
      ['.prettierrc'] = { name = 'Prettier', icon = 'P', cterm_color = pink },
  --
      ['clj'] = { name = 'Clojure', icon = '', cterm_color = green },
      ['cljc'] = { name = 'Clojure' },
      ['cljs'] = { name = 'Clojure' },
      ['edn'] = { name = 'Clojure' },
  --
      ['cr'] = { name = 'cr', icon = '' },
  --
      ['d'] = { name = 'D', icon = '' },
  --
      ['dart'] = { name = 'Dart', icon = '' },
  --
      ['djvu'] = { name = 'djvu', icon = '' },
  --
      ['doc'] = { name = 'Word', icon = '', cterm_color = blue },
      ['docx'] = { name = 'Word', icon = '', cterm_color = blue },
      ['gdoc'] = { name = 'Word', icon = '', cterm_color = blue },
      ['odt'] = { name = 'Word', icon = '', cterm_color = blue },
      ['ebook'] = { name = 'EBook', icon = '', cterm_color = orange },
      ['mobi'] = { name = 'EBook', icon = '', cterm_color = red },
      ['epub'] = { name = 'EBook', icon = '', cterm_color = red },
      ['pdf'] = { name = 'PDF', icon = '', cterm_color = red },
  --
      ['gslides'] = { name = 'PowerPoint', icon = '', cterm_color = orange },
      ['odp'] = { name = 'PowerPoint' },
  --
      ['xls'] = { name = 'Excel', icon = '', cterm_color = green },
      ['tsv'] = { name = 'Excel' },
      ['ods'] = { name = 'Excel' },
      ['gsheet'] = { name = 'Excel' },
      ['xlsx'] = { name = 'Excel' },
      ['csv'] = { name = 'CSV', icon = '' },
      ['gform'] = { name = 'gform', icon = '' },
  --
      ['docker-compose.yml'] = { name = 'Docker', icon = '', cterm_color = blue },
      ['dockerfile'] = { name = 'Docker' },
  --
      ['dropbox'] = { name = 'DropBox', icon = '' },
  --
      ['ejs'] = { name = 'ejs', icon = '', cterm_color = blue },
  --
      ['elm'] = { name = 'elm', icon = '' },
  --
      ['erl'] = { name = 'Erlang', icon = '', cterm_color = blue },
      ['hrl'] = { name = 'Erlang' },
  --
      ['f#'] = { name = 'FSharp', icon = '', cterm_color = red },
      ['fs'] = { name = 'FSharp' },
      ['fsi'] = { name = 'FSharp' },
      ['fsscript'] = { name = 'FSharp' },
      ['fsx'] = { name = 'FSharp' },
  --
      ['go'] = { name = 'GoLang', icon = '', cterm_color = red },
      ['go.mod'] = { name = 'GoLang' },
      ['go.sum'] = { name = 'GoLang' },
  --
      ['gradle'] = { name = 'Java', icon = '', cterm_color = red },
      ['jad'] = { name = 'Java' },
      ['war'] = { name = 'Java' },
      ['jar'] = { name = 'Java' },
      ['java'] = { name = 'Java' },
      ['class'] = { name = 'Java', cterm_color = blue },
      ['jl'] = { name = 'Java', cterm_color = blue },
  --
      ['groovy'] = { name = 'groovy', icon = '' },
      ['hs'] = { name = 'Haskall', icon = '', cterm_color = red },
      ['lhs'] = { name = 'Haskall' },
  --
      ['hxx'] = { name = 'Hxx', icon = '' },
      ['hh'] = { name = 'Hxx' },
      ['hpp'] = { name = 'Hxx' },
  --
      ['py'] = { name = 'Python', icon = '', cterm_color = yellow },
      ['ipynb'] = { name = 'Python' },
      ['pyc'] = { name = 'Python' },
      ['pyd'] = { name = 'Python' },
      ['pyo'] = { name = 'Python' },
      ['requirements.txt'] = { name = 'Requirements', icon = '', cterm_color = fg },
  --
      ['eex'] = { name = 'Elixir', icon = '', cterm_color = purple },
      ['ex'] = { name = 'Elixir' },
      ['exs'] = { name = 'Elixir' },
      ['leex'] = { name = 'Elixir' },
      ['mix.lock'] = { name = 'Elixir' },
  --
      ['license'] = { name = 'License', icon = '', cterm_color = fg },
      ['lock'] = { name = 'lock', icon = '', cterm_color = fg },
  --
      ['lua'] = { name = 'lua', icon = '', cterm_color = blue },
  --
      ['jmd'] = { name = 'Markdown', icon = '', cterm_color = orange },
      ['markdown'] = { name = 'Markdown', icon = '' },
      ['md'] = { name = 'Markdown', icon = '' },
      ['mdx'] = { name = 'Markdown', icon = '' },
      ['mkd'] = { name = 'Markdown', icon = '' },
      ['rdoc'] = { name = 'Markdown', icon = '' },
  --
      ['ml'] = { name = 'ML', icon = 'λ', cterm_color = purple },
      ['mli'] = { name = 'ML' },
  --
      ['part'] = { name = 'Temp', icon = '', cterm_color = fg },
      ['temp'] = { name = 'Temp' },
      ['tmp'] = { name = 'Temp' },
  --
      ['pp'] = { name = 'pp', icon = '' },
      ['procfile'] = { name = 'Kotkin', icon = '', cterm_color = green },
  --
      ['razor'] = { name = 'Razor', icon = '' },
      ['cshtml'] = { name = 'Razor' },
  --
      ['r'] = { name = 'R', icon = '', cterm_color = red },
      ['rdata'] = { name = 'R' },
      ['rdb'] = { name = 'R' },
      ['rds'] = { name = 'R' },
  --
      ['rlib'] = { name = 'Rlib', icon = '', cterm_color = blue },
      ['rs'] = { name = 'Rust', icon = '', cterm_color = orange },
  --
      ['rpm'] = { name = 'rpm', icon = '' },
  --
      ['.rvm'] = { name = 'Ruby', icon = '', cterm_color = red },
      ['config.ru'] = { name = 'Ruby' },
      ['gem'] = { name = 'Ruby' },
      ['gemfile'] = { name = 'Ruby' },
      ['gemspec'] = { name = 'Ruby' },
      ['guardfile'] = { name = 'Ruby' },
      ['rake'] = { name = 'Ruby' },
      ['rakefile'] = { name = 'Ruby' },
      ['rb'] = { name = 'Ruby' },
      ['rspec'] = { name = 'Ruby' },
      ['rspec_parallel'] = { name = 'Ruby' },
      ['rspec_status'] = { name = 'Ruby' },
      ['ru'] = { name = 'Ruby' },
  --
      ['rubydoc'] = { name = 'Rails', icon = '', cterm_color = green },
      ['erb'] = { name = 'Rails' },
      ['slim'] = { name = 'Rails' },
      ['rss'] = { name = 'rss', icon = '', cterm_color = red },
      ['scala'] = { name = 'scala', icon = '', cterm_color = blue },
      ['sqlite3'] = { name = 'SQL', icon = '', cterm_color = green },
      ['sql'] = { name = 'DB', icon = '', cterm_color = red },
      ['dump'] = { name = 'DB' },
      ['db'] = { name = 'DB' },
      ['pl'] = { name = 'Tor', icon = '', cterm_color = purple },
      ['plx'] = { name = 'Tor' },
      ['pm'] = { name = 'Tor' },
      ['pod'] = { name = 'Tor' },
      ['t'] = { name = 'Tor' },
  --
      ['cls'] = { name = 'Latex', icon = '', cterm_color = red },
      ['latex'] = { name = 'Latex', icon = '', cterm_color = blue },
      ['tex'] = { name = 'Latex', icon = '', cterm_color = blue },
      ['sty'] = { name = 'Latex', icon = '', cterm_color = red },
      ['bib'] = { name = 'Bibtex', icon = '', cterm_color = green },
      ['twig'] = { name = 'twig', icon = '', cterm_color = red },
      ['eot'] = { name = 'Font', icon = '', cterm_color = red },
  --
      ['log'] = { name = 'Log', icon = '', cterm_color = fg },
  --
      ['font'] = { name = 'Font' },
      ['otf'] = { name = 'Font' },
      ['ttf'] = { name = 'Font' },
      ['woff'] = { name = 'Font' },
      ['woff2'] = { name = 'Font' },
  --
      ['avif'] = { name = 'Image', icon = '', cterm_color = purple },
      ['bmp'] = { name = 'Image', icon = '', cterm_color = purple },
      ['gif'] = { name = 'Image', icon = '', cterm_color = purple },
      ['ico'] = { name = 'Image', icon = '', cterm_color = purple },
      ['image'] = { name = 'Image', icon = '', cterm_color = purple },
      ['j2c'] = { name = 'Image', icon = '', cterm_color = purple },
      ['j2k'] = { name = 'Image', icon = '', cterm_color = purple },
      ['jfi'] = { name = 'Image', icon = '', cterm_color = purple },
      ['jfif'] = { name = 'Image', icon = '', cterm_color = purple },
      ['jif'] = { name = 'Image', icon = '', cterm_color = purple },
      ['jp2'] = { name = 'Image', icon = '', cterm_color = purple },
      ['jpe'] = { name = 'Image', icon = '', cterm_color = purple },
      ['jpeg'] = { name = 'Image', icon = '', cterm_color = purple },
      ['jpg'] = { name = 'Image', icon = '', cterm_color = purple },
      ['jpx'] = { name = 'Image', icon = '', cterm_color = purple },
      ['jxl'] = { name = 'Image', icon = '', cterm_color = purple },
      ['png'] = { name = 'Image', icon = '', cterm_color = purple },
      ['pxm'] = { name = 'Image', icon = '', cterm_color = purple },
      ['tiff'] = { name = 'Image', icon = '', cterm_color = purple },
      ['webp'] = { name = 'Image', icon = '', cterm_color = purple },
      ['svg'] = { name = 'Vector', icon = '', cterm_color = purple },
      ['favicon.ico'] = { name = 'Favicon', icon = '', cterm_color = yellow },
      ['favicon.svg'] = { name = 'Favicon', icon = '', cterm_color = yellow },
  --
      ['flac'] = { name = 'Audio', icon = '', cterm_color = red },
      ['m4a'] = { name = 'Audio' },
      ['mp3'] = { name = 'Audio' },
      ['ogg'] = { name = 'Audio' },
      ['wav'] = { name = 'Audio' },
      ['avi'] = { name = 'Video', icon = '', cterm_color = purple },
      ['flv'] = { name = 'Video' },
      ['mkv'] = { name = 'Video' },
      ['mov'] = { name = 'Video' },
      ['mp4'] = { name = 'Video' },
      ['ogv'] = { name = 'Video' },
      ['video'] = { name = 'Video' },
      ['webm'] = { name = 'Video' },
  --
      ['xml'] = { name = 'XML', icon = '', cterm_color = green },
      ['xul'] = { name = 'XML' },
  --
      ['yarn.lock'] = { name = 'Yarn', icon = '๋', cterm_color = cyan },
      ['yaml'] = { name = 'Yaml', icon = '', cterm_color = purple },
      ['yml'] = { name = 'Yaml', icon = '', cterm_color = purple },
  --
      ['bz'] = { name = 'Archive', icon = '', cterm_color = fg },
      ['bz2'] = { name = 'Archive' },
      ['cpio'] = { name = 'Archive' },
      ['gz'] = { name = 'Archive' },
      ['lz'] = { name = 'Archive' },
      ['lz4'] = { name = 'Archive' },
      ['lzh'] = { name = 'Archive' },
      ['lzma'] = { name = 'Archive' },
      ['lzo'] = { name = 'Archive' },
      ['rar'] = { name = 'Archive' },
      ['tar'] = { name = 'Archive' },
      ['taz'] = { name = 'Archive' },
      ['tbz'] = { name = 'Archive' },
      ['tbz2'] = { name = 'Archive' },
      ['tgz'] = { name = 'Archive' },
      ['tlz'] = { name = 'Archive' },
      ['txz'] = { name = 'Archive' },
      ['tz'] = { name = 'Archive' },
      ['tzo'] = { name = 'Archive' },
      ['xz'] = { name = 'Archive' },
      ['zip'] = { name = 'Archive' },
      ['zst'] = { name = 'Archive' },
}

if webdev.has_loaded then
  webdev.set_icon(icons)
  webdev.set_default_icon('', '#ffffff', fg)
else
  webdev.setup {
    override = icons,
    default = false,
  }
end
local disabled_built_ins = {
  -- 'netrw',
  -- 'netrwPlugin',
  -- 'netrwSettings',
  -- 'netrwFileHandlers',
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'logipat',
  'rrhelper',
  'spellfile_plugin',
  'matchit',
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g['loaded_' .. plugin] = 1
end

return require 'paq' {

  -- Interface
  -- 'RRethy/vim-illuminate',

  -- Functionality
  { 'echasnovski/mini.align', branch = 'stable' },
  'mattn/emmet-vim',
  'numToStr/Comment.nvim',
  'gaoDean/autolist.nvim',
  'christoomey/vim-tmux-navigator',
  'ggandor/leap.nvim',
  -- 'jiangmiao/auto-pairs',
  { 'altermo/ultimate-autopair.nvim' , branch = 'v0.6' },
  'tpope/vim-surround',
  'uga-rosa/ccc.nvim',

  -- Misc.
  'lewis6991/impatient.nvim',
  'savq/paq-nvim',

  -- LSP
  'b0o/schemastore.nvim',
  { 'j-hui/fidget.nvim', branch = 'legacy' },
  'neovim/nvim-lspconfig',
  'ray-x/lsp_signature.nvim',

  -- Completion
  { 'L3MON4D3/LuaSnip', branch = 'v1.0.0' },
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-buffer',
  'saadparwaiz1/cmp_luasnip',

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

  -- Git
  'mhinz/vim-signify',

  -- Telescope
  { 'nvim-telescope/telescope.nvim', branch = '0.1.4' },
  'nvim-lua/plenary.nvim',

  'stevearc/oil.nvim',

  -- -- debugger
  -- 'mfussenegger/nvim-dap',
  -- 'LiadOz/nvim-dap-repl-highlights',
  -- 'mxsdev/nvim-dap-vscode-js', -- depends: github.com/microsoft/vscode-js-debug
}

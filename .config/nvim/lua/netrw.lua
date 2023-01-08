-- Goal: modify netrw into something cool so that you don't need to downloadd
-- another pluin.

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_altv = 1
vim.g.netrw_list_hide = '^./$,^../$,^.DS_Store$'
vim.g.netrw_hide = 1

vim.keymap.set('n', '<leader>j', ':12Lexplore . <cr>')

vim.cmd [[
function! NetrwMapping()
  nmap <buffer> H u
  nmap <buffer> h -^
  nmap <buffer> l <CR>:Lexplore<cr>

  nmap <buffer> . gh
  nmap <buffer> P <C-w>z

  nmap <buffer> L <CR>:Lexplore<CR>
  nmap <buffer> <Leader>dd :Lexplore<CR>
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END
]]

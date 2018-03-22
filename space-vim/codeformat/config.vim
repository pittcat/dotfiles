"vim-format 设置
"{
" au FileType python,php,ruby,c,cpp,go,xml,html nnoremap <LocalLeader>= :Autoformat<CR>
" au FileType python,php,ruby,c,cpp,go,xml,html noremap <F3> :Autoformat<CR>
" au FileType python,php,ruby,c,cpp,go,xml,html autocmd BufWritePre <buffer> :%s/\s\+$//e
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 1
" let g:formatter_yapf_style = 'pep8'
"{
nnoremap <F3> :Neoformat<cr>
nnoremap <localleader>= :Neoformat<cr>
let g:neoformat_enabled_python = ['yapf']
let g:neoformat_enabled_html = ['prettydiff']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_less= ['prettier']
let g:neoformat_enabled_scss = ['prettier']
let g:neoformat_enabled_json = ['prettier']
let g:neoformat_enabled_graphql = ['prettier']
let g:neoformat_enabled_markdown = ['prettier']
let g:neoformat_enabled_vue = ['prettier']
let g:neoformat_enabled_rust = ['rustfmt']
let g:neoformat_enabled_rust = ['rubocop']
let g:neoformat_enabled_c = ['clang-format']
let g:neoformat_enabled_cpp = ['clang-format']


" {vim lsp
let g:lsp_preview_keep_focus = get(g:, 'lsp_preview_keep_focus', 0)
noremap <silent> gd :LspDefinition<cr> 
noremap <silent> <leader>sh :LspHover<cr> 
noremap <silent> <leader>cn :LspRename<cr>
autocmd FileType *.lsp-hover  nnoremap <buffer><silent> q :quit<cr>

" python
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

" javascript
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript','javascript','javascript.jsx'],
        \ })
endif

" cpp
" au FileType c,cpp,objc,objcpp nnoremap <buffer><Leader>cn :ClangRenameCurrent<cr>
" if executable('clangd')
    " au User lsp_setup call lsp#register_server({
        " \ 'name': 'clangd',
        " \ 'cmd': {server_info->['clangd']},
        " \ 'whitelist': ['c','cpp','objc','objcpp'],
        " \ })
" endif
if executable('cquery')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'cquery',
      \ 'cmd': {server_info->['cquery']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery' },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
      \ })
endif

" golang
if executable('go-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'go-langserver',
        \ 'cmd': {server_info->['go-langserver', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
endif

" rust
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

" css scss
if executable('css-languageserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'css-languageserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
        \ 'whitelist': ['css', 'less', 'sass'],
        \ })
endif

" php
au User lsp_setup call lsp#register_server({                                    
     \ 'name': 'php-language-server',                                            
     \ 'cmd': {server_info->['php', expand('~/.vim/plugged/php-language-server/bin/php-language-server.php')]},
     \ 'whitelist': ['php'],                                                     
     \ })

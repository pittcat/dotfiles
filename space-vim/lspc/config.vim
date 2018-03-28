let g:LanguageClient_serverCommands = {
    \ 'python':['pyls'],
    \ 'cpp': ['cquery','--language-server','--log-file=/tmp/cq.log'],                                                                                                                                                                              
    \ 'c': ['cquery', '--log-file=/tmp/cq.log'],                                                                                                                                                                              
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ }
let g:LanguageClient_loadSettings = 1
" Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = '~/.vim/settings.json'
let g:LanguageClient_loggingLevel = 'DEBUG'

nnoremap <silent> <leader>sh :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>cn :call LanguageClient_textDocument_rename()<CR>

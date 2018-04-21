let g:LanguageClient_serverCommands = {
    \ 'python':['pyls'],
    \ 'cpp': ['cquery','--language-server','--log-file=/tmp/cq.log'],                                                                                                                                                                              
    \ 'c': ['cquery','--language-server','--log-file=/tmp/cq.log'],                                                                                                                                                                              
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ }
let g:LanguageClient_autoStart = 1
let g:LanguageClient_loadSettings = 1
" Use an absolute configuration path if you want system-wide settings
if g:spacevim_vim8
  let g:LanguageClient_settingsPath = '~/.vim/settings.json'
else
  let g:LanguageClient_settingsPath = '~/.config/nvim/settings.json'
endif
let g:LanguageClient_loggingLevel = 'DEBUG'
" disable interact with ale
let g:LanguageClient_diagnosticsEnable=0

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>cn :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <leader><leader>z :pc<CR>

augroup LanguageClient_config
  autocmd!
  autocmd User LanguageClientStarted setlocal signcolumn=yes
  autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

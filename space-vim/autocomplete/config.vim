scriptencoding utf-8

if g:spacevim_vim8 || g:spacevim_nvim
  inoremap <expr> <down> pumvisible() ? "\<C-n>" : "\<down>"
  inoremap <expr> <up> pumvisible() ? "\<C-p>" : "\<up>"
  " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
else
endif

if g:spacevim_vim8 
  if !empty(glob("$HOME/.vim/plugged/completor.vim"))
    
    " completor.vim
    set completeopt-=preview  "close show_docstring
    let g:completor_ruby_omni_trigger = "\\w+$|[\\w\\)\\]\\}\'\"]+\\.\\w*$"
    let g:completor_css_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'
    let g:completor_php_omni_trigger = '([$\w]+|use\s*|->[$\w]*|::[$\w]*|implements\s*|extends\s*|class\s+[$\w]+|new\s*)$'


  elseif !empty(glob("$HOME/.vim/plugged/neocomplete.vim"))
  " neocomplete.vim {
    " Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

    " https://github.com/Shougo/neocomplete.vim/issues/42
    let g:neocomplete#sources#omni#input_patterns.erlang = '[^. *\t]:\w*'
  " }
  
  endif
endif




if  g:spacevim_nvim

  if !empty(glob("$HOME/.local/share/nvim/plugged/deoplete.nvim"))
    set completeopt-=preview  "close show_docstring
    let g:deoplete#enable_at_startup = 1
    " Set minimum syntax keyword length.
    let g:min_pattern_length=2
    
    " buffer improve
    let g:require_same_filetype='False'

    " delay
    let g:deoplete#auto_complete_delay=0
    " auto_refresh
    let g:auto_refresh_delay=0
    
    let refresh_always=true
    


    " Plugin key-mappings.
    inoremap <expr><C-g>     deoplete#undo_completion()
    inoremap <expr><C-l>     deoplete#refresh()

    " <C-h>: close popup and delete backword char.
    inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"

    " register omni
    call deoplete#custom#source('omni', 'functions', {
    \ 'html': 'htmlcomplete#CompleteTags',
    \ 'css' : 'csscomplete#CompleteCSS',
    \ 'scss' : 'csscomplete#CompleteCSS',
    \ 'sass' : 'csscomplete#CompleteCSS',
    \ 'xml' : 'xmlcomplete#CompleteTags',
    \ 'markdown' : 'htmlcomplete#CompleteTags',
    \ })

    call deoplete#custom#source('omni', 'input_patterns', {
    \ 'html' : '<[^>]',
    \ 'css'  : '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]',
    \ 'scss' : '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]',
    \ 'sass' : '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]',
    \ 'xml'  : '<[^>]*',
    \ 'md'   : '<[^>]*',
    \})

    " fix conflict with multiple_cursors
    function! g:Multiple_cursors_before()
      call deoplete#custom#buffer_option('auto_complete', v:false)
    endfunction
    function! g:Multiple_cursors_after()
      call deoplete#custom#buffer_option('auto_complete', v:true)
    endfunction
  " }


endif

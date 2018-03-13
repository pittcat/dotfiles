scriptencoding utf-8

if g:spacevim_vim8 || g:spacevim_nvim
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
else
endif

if g:spacevim_vim8 
  if !empty(glob("$HOME/.vim/plugged/completor.vim"))
    
    " completor.vim
    set completeopt-=preview  "close show_docstring
    set <F26>=n
    noremap <silent> <F26> :call completor#do('definition')<cr>
    noremap <silent> <s-k> :call completor#do('doc')<cr>

    let g:completor_ruby_omni_trigger = "\\w+$|[\\w\\)\\]\\}\'\"]+\\.\\w*$"
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
    let g:deoplete#sources#syntax#min_keyword_length = 3

   " Define dictionary.
    let g:deoplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

    " Define keyword.
    if !exists('g:deoplete#keyword_patterns')
      let g:deoplete#keyword_patterns = {}
    endif
    let g:deoplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     deoplete#undo_completion()
    inoremap <expr><C-l>     deoplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:deoplete#omni#input_patterns')
      let g:deoplete#omni#input_patterns = {}
    endif
    "let g:deoplete#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:deoplete#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:deoplete#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:deoplete#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    let g:deoplete#omni#input_patterns.erlang = '[^. *\t]:\w*'
  " }


  elseif !empty(glob("$HOME/.local/share/nvim/plugged/nvim-completion-manager"))
    " ncm-----common
     
    set shortmess+=c
    let g:cm_smart_enable=1
    let g:cm_matcher = {'module': 'cm_matchers.substr_matcher', 'case': 'smartcase'}
    let g:cm_refresh_default_min_word_len=2
    let g:cm_complete_popup_delay=90
    " let g:cm_completeopt = 'menu,menuone,noinsert,noselect'

    " augroup ncm_preview
        " autocmd! InsertLeave <buffer> if pumvisible() == 0|pclose|endif
    " augroup END


    " deoplete-----extend for ncm sources setting

    call deoplete#enable()          " force init deoplete then hack deoplete's mapping
    au User CmSetup call cm#register_source({'name' : 'deoplete',
            \ 'priority': 7,  
            \ 'abbreviation': '', 
            \ })                      " register as ncm source

    " hack deoplete's mapping
    inoremap <silent> <Plug>_ <C-r>=g:Deoplete_ncm()<CR>

    func! g:Deoplete_ncm()            " forward to ncm
      call cm#complete('deoplete', cm#context(), g:deoplete#_context.complete_position + 1, g:deoplete#_context.candidates)
      return ''
    endfunc

  endif
endif

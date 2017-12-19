 " python
  " {
  " pymode 设置
    let g:pymode_python = 'python3'       
    let g:pymode_doc = 1     "启用python-mode内置的python文档，使用K进行查找
    let g:pymode_doc_bind = 'K'
    let g:c_no_curly_error=0
    " fisadev/vim-isort
    let g:vim_isort_map = '<C-i>'
    let g:vim_isort_python_version = 'python3'
  " }

 " web
  " {
  " html

   "javascript 
  "javascript-libraries-syntax.vim
  let g:used_javascript_libs = 'underscore,backbone,jquery,vue,requirejs'
  autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
  autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
  autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
  autocmd BufReadPre *.js let b:javascript_lib_use_vue = 1
  autocmd BufReadPre *.js let b:javascript_lib_use_requirejs = 1
  " }







"vim-format 设置
  "{
  noremap <F3> :Autoformat<CR>
  let g:autoformat_autoindent = 0
  let g:autoformat_retab = 0
  let g:autoformat_remove_trailing_spaces = 0
  autocmd FileType html,css,js autocmd BufWritePre <buffer> :%s/\s\+$//e
  let g:formatter_yapf_style = 'pep8'
  "}
  "消除空白
  "{
  fun! DelBlank()
    let _s=@/
    let l = line(".")
    let c = col(".")
    :g/^\n\{2,}/d
    let @/=_s
    call cursor(l, c)
    endfun
    map <special> <leader>dw :keepjumps call DelBlank()<cr>
  " }
    "修复Multiple_cursors和neocomplete的冲突
    "{
    " function! Multiple_cursors_before()
      " exe 'NeoCompleteLock'
      " " echo 'Disabled autocomplete'
    " endfunction

    " function! Multiple_cursors_after()
      " exe 'NeoCompleteUnlock'
      " " echo 'Enabled autocomplete'
    " endfunction
  " }
  " {
    let g:multi_cursor_next_key='<C-d>'
    let g:multi_cursor_prev_key='<C-u>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
  " }
  "tpope/vim-eunuch
  "{rename and mkdir 
    noremap <leader>rn :Move 
    noremap <leader>cd :Mkdir 
  "}
  "quickfix
  "{
    noremap <silent> <localleader>q :cclose<cr>
    noremap <silent> <localleader>o :copen<cr>
  "}
  "{Limelight and goyo
  autocmd User GoyoEnter Limelight
  autocmd User GoyoLeave Limelight!
  let g:limelight_conceal_ctermfg='gray'
  let g:limelight_conceal_ctermfg=240
  let g:limelight_default_coefficient=0.7
  "
  "}
  "fold
  "{
  set foldmethod=manual
  "}
  "{gv.vim
  noremap <silent> <leader>cg :GV<cr>
  "}
  "buffer and file 
  "{
  function! DeleteFileAndCloseBuffer()
    call delete(expand('%')) | bdelete!
  endfun
  " noremap <silent> <leader>df :Delete<cr>
  noremap <silent> <leader>df :call DeleteFileAndCloseBuffer()<cr>
  noremap <silent> <leader>da ggdG
  "}
  "{
  " inoremap <expr> \  pumvisible() ? "\<C-y>" : "\<CR>"
  inoremap  <C-v> <esc>gUiwea
  inoremap  <C-c> <esc>gUla
  "}
  "{FZF
  nnoremap <Leader>f? :Files ~<CR>
  nnoremap <Leader>ff :Files<CR>
  nnoremap <Leader>fp :Files ~/.space-vim/private<CR>
  "}
  "
  "{YankRing.vim
  " let g:yankring_history_dir='~/.vim/'
  " noremap <silent> <Leader>sy :YRShow<CR>
  "}
  "{use Yggdroot/indentLine
  let g:indentLine_enable=1
  noremap <silent> <Leader>ti :IndentLinesToggle<cr>
  let g:indentLine_setColors = 1
  let g:indentLine_char = '┆'
  "}
  "
  "{change window quickly
  nnoremap <localleader>ww <C-W>w
  nnoremap <leader><Right> <C-w>l
  nnoremap <leader><Left> <C-w>h
  nnoremap <leader><Up> <C-w>k
  nnoremap <leader><Down> <C-w>j
  "}
  "{BufOnly 
  nnoremap <leader>bD :BufOnly<cr>
  "}
  "{quick indent visual with tab
  vnoremap  <tab> >gv
  vnoremap  <S-tab> <gv
  "}
  "{vim-scripts/loremipsum
  nnoremap <silent> <leader>gn :Loremipsum<cr>
  "}
  "{codi.vim
  noremap <silent> <localleader>cd :Codi!!<cr>
  "}
  "{epeli/slimux
  let g:slimux_select_from_current_window = 0
  set <F23>=s
  set <F24>=a
  set <F25>=c
  imap <silent> jk <esc>:SlimuxREPLSendBuffer<CR>
  imap <silent> <F23> <esc>:SlimuxREPLSendBuffer<CR>s
  nmap <silent> <F24> <esc>:SlimuxREPLSendBuffer<CR>
  nmap <silent> <F25> <esc>:SlimuxREPLConfigure
  nmap <silent> <C-c><C-c> :SlimuxREPLSendLine<CR>
  vmap <silent> <C-c><C-c> :SlimuxREPLSendSelection<CR>
  "}
  "{othree/csscomplete.vim
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
  "}
  "
  "{briandoll/change-inside-surroundings.vim
  noremap <silent> <localleader>ci :ChangeInsideSurrounding<cr>
  noremap <silent> <localleader>cas :ChangeAroundSurrounding<cr>
  "}


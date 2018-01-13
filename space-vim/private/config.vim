if g:spacevim_nvim

  " ncm----------lang extend 

  


  " deoplete-------lang extend


  " deoplete-common
  let g:python3_host_prog ='/usr/bin/python3'   "nvim path 
  let g:deoplete#enable_at_startup = 1         "start deoplete
  let g:deoplete#enable_smart_case = 0


  " ncm-----common
   
  set shortmess+=c
  let g:cm_sources_override = {
      \ 'cm-tags': {'enable':0}
      \ }
  " let g:cm_completeopt = 'menu,menuone,noinsert,noselect,preview'

  " augroup ncm_preview
      " autocmd! InsertLeave <buffer> if pumvisible() == 0|pclose|endif
  " augroup END


  " deoplete-----extend for ncm sources setting

  " call deoplete#enable()          " force init deoplete then hack deoplete's mapping

  " au User CmSetup call cm#register_source({'name' : 'deoplete',
          " \ 'priority': 7,  
          " \ 'abbreviation': '', 
          " \ })                      " register as ncm source

  " " hack deoplete's mapping
  " inoremap <silent> <Plug>_ <C-r>=g:Deoplete_ncm()<CR>

  " func! g:Deoplete_ncm()            " forward to ncm
    " call cm#complete('deoplete', cm#context(), g:deoplete#_context.complete_position + 1, g:deoplete#_context.candidates)
    " return ''
  " endfunc


else    "vim8
  " completor.vim
  set completeopt-=preview  "close show_docstring
  set <F26>=d
  noremap <silent> <F26> :call completor#do('definition')<cr>
  noremap <silent> <s-k> :call completor#do('doc')<cr>

  let g:completor_clang_binary='/usr/bin/clang' "c++
  let completor_node_binary='/usr/bin/node'   "javascript
  let g:completor_python_binary = '/usr/bin/python3' "python 
  let g:completor_ruby_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'      "install vim-monster-------ruby
  " let g:completor_gocode_binary='/home/pittcat/go/bin/gocode' "go
  " let g:completor_racer_binary='/home/pittcat/.cargo/bin/racer' "rust

endif 


" snippet
if g:spacevim_nvim || g:spacevim_vim8
  let g:UltiSnipsSnippetDirectories=['UltiSnips']
  exe 'set rtp+=' . expand(g:spacevim_dir . '/private/UltiSnips')
  let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
  let g:UltiSnipsExpandTrigger = '<C-e>'
  let g:UltiSnipsJumpForwardTrigger = '<C-j>'
  let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

  let g:ulti_expand_or_jump_res = 0
  function! ExpandSnippetOrCarriageReturn()
    let l:snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
      return l:snippet
    else
      return "\<CR>"
    endif
  endfunction
  inoremap <expr> <CR> pumvisible() ? "\<C-R>=ExpandSnippetOrCarriageReturn()\<CR>" : "\<CR>"



  if g:spacevim_nvim
    let g:UltiSnipsRemoveSelectModeMappings = 0
    " inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
    inoremap <silent> <c-l> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
    xmap <c-l> <Plug>(ultisnips_expand)
    smap <c-l> <Plug>(ultisnips_expand)

    let g:cm_complete_delay = 0

  endif

endif



 " python
  " {
  " pymode 设置
    let g:pymode_python = 'python3'       
    let g:pymode_doc = 0     "启用python-mode内置的python文档，使用K进行查找
    let g:pymode_doc_bind = 'K'
    let g:c_no_curly_error=0
    " fisadev/vim-isort
    let g:vim_isort_map = '<C-i>'
    let g:vim_isort_python_version = 'python3'
    " skywind3000/asyncrun.vim <F5> 快捷键运行
    let g:spacevim_python_run = 'python3'
  " }

 " web
  " {
  " html
  let g:user_emmet_leader_key='<Tab>'
  let g:user_emmet_settings = {
    \  'javascript.jsx' : {
      \      'extends' : 'jsx',
      \  },
    \}            "emmet 


  let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx"       "auto-closetag添加对jsx等的支持
   "javascript 
  let g:javascript_plugin_jsdoc = 1       "pangloss/vim-javascript
  let g:jsx_ext_required = 0              "mxw/vim-jsx
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
  "{rstacruz/vim-xtract
  vnoremap <localleader>et :Xtract 
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
  "
  "{AndrewRadev/linediff.vim
  vmap <localleader>df :Linediff<cr>
  vmap <localleader>dr :LinediffReset<cr>
  nmap <localleader>ls :LinediffShow<cr>
  "}
  " {terryma/vim-smooth-scroll
  noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
  noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
  " }
  " {iamcco/dict.vim
  let g:api_key = "1932136763"
  let g:keyfrom = "aioiyuuko"
  nmap <silent> <localleader>yd <Plug>DictWSearch
  vmap <silent> <localleader>yd <Plug>DictWVSearch
    "}
    "{dyng/ctrlsf.vim
  vmap <silent> <localleader>cf <Plug>CtrlSFVwordExec
  nmap <silent> <localleader>cf <Plug>CtrlSFCwordPath<cr>
    "}
    "
    "{fzf neoyank
  nnoremap <silent> <leader>fy :FZFNeoyank<cr>
    "} 

 " snippet配置
 " {


" if g:spacevim_nvim

  "通用配置<c-y>
  " inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"       


  " neosnippet--vim8 或者 neovim

  " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  " ncm
  " imap <expr> <Tab> (pumvisible() ? "\<C-n>" : (neosnippet#mappings#expand_or_jump_impl()!=''?neosnippet#mappings#expand_or_jump_impl():"\<Tab>"))
  " deoplete completor
  " imap <expr><TAB>
  " \ pumvisible() ? "\<C-n>" :
  " \ neosnippet#expandable_or_jumpable() ?
  " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  " smap <Tab>     <Plug>(neosnippet_expand_or_jump)  
  " xmap <Tab>     <Plug>(neosnippet_expand_target)   
  " neosnippet doesn't have jump back key
  " imap <expr> <S-Tab> (pumvisible() ? "\<C-p>" : "\<S-Tab>")

 
    
" endif

  " }

  

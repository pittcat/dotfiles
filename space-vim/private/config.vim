if g:spacevim_nvim

  " ncm----------lang 
  

  " deoplete-------lang extend
  let g:tmuxcomplete#trigger = ''     "  'wellle/tmux-complete.vim'
  let g:deoplete#sources#jedi#python_path='/usr/bin/python3'  "zchee/deoplete-jedi
  let g:deoplete#sources#ternjs#tern_bin = '/usr/bin/tern'    "carlitux/deoplete-ternjs
  let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'   "zchee/deoplete-clang
  let  g:deoplete#sources#clang#clang_header='/usr/lib/clang'
  let g:deoplete#sources#rust#racer_binary='/home/pittcat/.cargo/bin/racer'          "sebastianmarkow/deoplete-rust
  let g:deoplete#sources#rust#rust_source_path='/home/pittcat/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'                "echo `rustc --print sysroot`/lib/rustlib/src/rust/src
  let g:deoplete#sources#rust#documentation_max_height=30

  " deoplete-common
  let g:deoplete#auto_complete_delay=70
  let g:python3_host_prog ='/usr/bin/python3'   "nvim path 
  let g:python_host_prog ='/usr/bin/python'   "nvim path 



else    "vim8
    let g:completor_clang_binary='/usr/bin/clang' "c++
    let completor_node_binary='/usr/bin/node'   "javascript
    " let g:completor_tsserver_binary = '/usr/bin/tsserver'
    " let g:completor_tsserver_binary = '/usr/bin/tsserver'
    let g:completor_python_binary = '/usr/bin/python3' "python 
    let g:completor_css_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'
  " let g:completor_gocode_binary='/home/pittcat/go/bin/gocode' "go
    let g:completor_racer_binary='~/.cargo/bin/racer' "rust
    au FileType rust map <silent> gd :call completor#do('definition') <CR>    
    " au FileType rust map <silent> gd :call completor#do('definition') <CR>    
    " noremap <s-k> :call completor#do('doc')<CR>
endif 


" snippet
" if g:spacevim_nvim || g:spacevim_vim8


 " python
  " {
  " pymode 设置
    let g:pymode_python = 'python3'       
    let g:pymode_doc = 0     "启用python-mode内置的python文档，使用K进行查找
    let g:pymode_doc_bind = 'K'
    let g:pymode_rope = 0
    let g:c_no_curly_error=0
    " fisadev/vim-isort
    let g:vim_isort_map = '<C-i>'
    let g:vim_isort_python_version = 'python3'
    autocmd BufLeave *.py Isort
    " skywind3000/asyncrun.vim <F5> 快捷键运行
    let g:spacevim_python_run = 'python3'
  " }

 " web
  " {
  " html
  " let g:bracey_server_port=12304
  let g:user_emmet_leader_key='<C-e>'
  let g:user_emmet_settings = {
    \  'javascript.jsx' : {
      \      'extends' : 'jsx',
      \  },
    \}            "emmet 


  let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx"       "auto-closetag添加对jsx等的支持
   "javascript 
  let g:javascript_plugin_jsdoc = 1       "pangloss/vim-javascript
  let g:jsx_ext_required = 0              "mxw/vim-jsx
  
  " typescript
  let g:tsuquyomi_disable_quickfix=1

  "skywind3000/asyncrun.vim
  au FileType javascript map <silent> <F5> :AsyncRun! time node %<CR>    
  " css
  " autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
   " }

  " md
  " {
  let g:livedown_autorun = 0
  nmap <silent> <leader>mdp :LivedownPreview<cr>
  nmap <silent> <leader>mdt :LivedownToggle<cr>
  " }

  

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
  inoremap  <C-v> <esc>gUiwea
  "}
  "{FZF
  nnoremap <Leader>f? :Files ~<CR>
  " nnoremap <Leader>ff :Files<CR>
  nnoremap <Leader>fp :Files ~/MEGA/code/dotfiles<CR>
  "}
  "
  "{use Yggdroot/indentLine
  let g:indentLine_enable=1
  noremap <silent> <Leader>ti :IndentLinesToggle<cr>
  let g:indentLine_setColors = 1
  let g:indentLine_char = '┆'
  "}
  "
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
  " noremap <silent> <localleader>cd :Codi!!<cr>
  "}
  "{epeli/slimux
  let g:slimux_select_from_current_window = 0
  set <F25>=c
  imap <silent> jk <esc>:SlimuxREPLSendBuffer<CR>
  nmap  <F25> :SlimuxREPLConfigure<cr>
  nmap <silent> <C-c><C-c> :SlimuxREPLSendLine<CR>
  vmap <silent> <C-c><C-c> :SlimuxREPLSendSelection<CR>
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
   "{tweekmonster/fzf-filemru
  noremap <silent> <leader>ff :FilesMru<cr>
   "}
    "{create new tab 
  nmap <leader>nb :edit 
    "}
    "
  " {map filename complete
  set <F23>=.
  inoremap <F23> <C-X><C-F>
  " }
  " {open .spacevim
  noremap <silent> <leader>fed :edit ~/.spacevim<cr>
  " }
 "  {'wsdjeg/FlyGrep.vim'
  nnoremap <leader>s/ :FlyGrep<cr>
 "  }
 "  {dhruvasagar/vim-table-mode
   "" Use this option to define the table corner character
  let g:table_mode_corner = '|'
  " Use this option to define the delimiter which used by
  let g:table_mode_delimiter = ' '
  noremap <leader>itb :Tableize<cr>
  " }
  " { mhinz/vim-startify
  let g:startify_session_persistence = 1
  noremap <silent> <leader>sv :SSave<cr>
  noremap <silent> <leader>sr :SLoad<cr>
  " }
" {vim qf
  autocmd BufWinEnter quickfix nnoremap <silent> <buffer>
              \   q :cclose<cr>:lclose<cr>
  autocmd BufEnter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) |
              \   bd|
              \   q | endif
" }
"{pelodelfuego/vim-swoop
noremap <leader>ds :bdelete swoopBuf<cr>
"}
"{codi.vim
noremap <silent> <localleader>cd :Codi!!<cr>
"}
"{ctrlptmux
nnoremap <Leader>my :CtrlPTmux b<cr>
"}

"{airblade/vim-rooter
let g:rooter_change_directory_for_non_project_files = 'current'
"}
"{scrooloose/nerdtree
noremap <silent> <leader>nc :NERDTreeCWD<cr>
"}
"

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
  if executable('clangd')
      au User lsp_setup call lsp#register_server({
          \ 'name': 'clangd',
          \ 'cmd': {server_info->['clangd']},
          \ 'whitelist': ['c','cpp','objc','objcpp'],
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
  " {terminal
  if has('nvim')
    fu! OpenTerminal()
    " open split windows on the topleft
    belowright split
    " resize the height of terminal windows to 30
    :terminal
    startinsert
    endf
  else
    fu! OpenTerminal()
    " open split windows on the topleft
    belowright split
    " resize the height of terminal windows to 30
    :call term_start('zsh', {'curwin' : 1, 'term_finish' : 'close'})
    endf
  endif
  nnoremap <leader>' :call OpenTerminal()<cr>

  if spacevim_nvim
    autocmd! FileType fzf tnoremap  <Esc> <Esc>
    tnoremap <expr> <Esc> "<C-\><C-n><CR>"
    tnoremap <expr> <C-d> "<C-\><C-n>:bd!<cr>"
  else
    tnoremap <expr> <Esc> "<C-\><C-n>"
  endif

  " window resize
  set <F26>==
  set <F27>=-
  set <F28>=)
  set <F29>=(
  nnoremap <silent> <F26> :res +6<cr>
  nnoremap <silent> <F27> :res -6<cr>
  nnoremap <silent> <F28> :vertical res +6<cr>
  nnoremap <silent> <F29> :vertical res -6<cr>
  " }
  " {
  " ale
  nnoremap <silent> <leader>ed :ALEDetail<cr>
  nnoremap <silent> <leader>ef :ALEFix<cr>
  let g:ale_linters = {
            \ 'sh' : ['shellcheck'],
            \ 'vim' : ['vint'],
            \ 'html' : ['tidy'],
            \ 'python' : ['flake8'],
            \ 'markdown' : ['mdl'],
            \ 'javascript.jsx' : ['eslint'],
            \ 'javascript' : ['eslint'],
            \}
  let g:ale_fixers = {
  \  'python': ['yapf'],
  \  'ruby': ['rubocop'],
  \  'javascript': ['prettier'],
  \  'json': ['prettier'],
  \  'css': ['prettier'],
  \  'markdown': ['prettier'],
  \}
  " }
let g:neoformat_only_msg_on_error = 0
let g:neoformat_try_formatprg = 1

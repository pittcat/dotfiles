if g:spacevim_nvim

  " ncm----------lang 
  

  " deoplete-------lang extend
  let g:tmuxcomplete#trigger = ''     "  'wellle/tmux-complete.vim'
  let g:deoplete#sources#jedi#python_path='/usr/bin/python3'  "zchee/deoplete-jedi
  let g:deoplete#sources#jedi#server_timeout=100
  let g:deoplete#sources#jedi#debug_server=1
  let g:deoplete#sources#ternjs#tern_bin = '/usr/bin/tern'    " carlitux/deoplete-ternjs
  let g:deoplete#sources#ternjs#filetypes = [
                  \ 'javascript',
                  \ 'jsx',
                  \ 'javascript.jsx',
                  \ 'vue',
                  \ ]
  let g:nvim_typescript#server_path='/usr/bin/tsserver'       " mhartington/nvim-typescript
  let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'   "zchee/deoplete-clang
  let  g:deoplete#sources#clang#clang_header='/usr/lib/clang'
  let g:deoplete#sources#rust#racer_binary='/home/pittcat/.cargo/bin/racer'          "sebastianmarkow/deoplete-rust
  let g:deoplete#sources#rust#rust_source_path='/home/pittcat/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'                "echo `rustc --print sysroot`/lib/rustlib/src/rust/src
  let g:deoplete#sources#rust#documentation_max_height=30

  " deoplete-common
  let g:python3_host_prog ='/usr/bin/python3'   "nvim path 
  let g:python_host_prog ='/usr/bin/python'   "nvim path 

  call deoplete#custom#source('LanguageClient','mark', 'ℰ')
  call deoplete#custom#source('omni',          'mark', '⌾')
  call deoplete#custom#source('flow',          'mark', '⌁')
  call deoplete#custom#source('TernJS',        'mark', '⌁')
  call deoplete#custom#source('go',            'mark', '⌁')
  call deoplete#custom#source('jedi',          'mark', '⌁')
  call deoplete#custom#source('vim',           'mark', '⌁')
  call deoplete#custom#source('ultisnips',     'mark', '⌘')
  call deoplete#custom#source('around',        'mark', '↻')
  call deoplete#custom#source('buffer',        'mark', 'ℬ')
  call deoplete#custom#source('tmux-complete', 'mark', '⊶')
  call deoplete#custom#source('syntax',        'mark', '♯')
  call deoplete#custom#source('member',        'mark', '.')

  call deoplete#custom#source('LanguageClient', 'rank', 100)    " change the languageclient ranking
  call deoplete#custom#source('ultisnips', 'rank', 1000)    " change the snippet ranking
  call deoplete#custom#option('ignore_sources', {'_': ['LanguageClient']})    " disable LC


  

else    "vim8
    let g:completor_clang_binary='/usr/bin/clang' "c++
    let completor_node_binary='/usr/bin/node'   "javascript
    " let g:completor_tsserver_binary = '/usr/bin/tsserver'
    " let g:completor_tsserver_binary = '/usr/bin/tsserver'
    let g:completor_python_binary = '/usr/bin/python3' "python 
    let g:monster#completion#backend = 'solargraph'    "ruby
    let g:completor_gocode_binary='~/.go/bin/gocode' "go
    let g:completor_racer_binary='~/.cargo/bin/racer' "rust
    let g:completor_tsserver_binary = '/usr/bin/tsserver'
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
  autocmd BufEnter *.js setfiletype javascript
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
    let g:multi_cursor_use_default_mapping=0
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
    function! Map_Qf_Behavior()
      function! QFwinnr() 
         let i=1 
         while i <= winnr('$') 
             if getbufvar(winbufnr(i), '&buftype') == 'quickfix' 
                 return i 
             endif 
             let i += 1 
         endwhile 
         return 0 
      endfunction 

      if QFwinnr()
        exec 'cclose'
      else
        exec 'copen 16'
      endif
    endfun
    nnoremap <silent> <F8> :call Map_Qf_Behavior()<cr>
  "}
  "{justinmk/vim-sneak
    map f <Plug>Sneak_s
    map F <Plug>Sneak_S
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
  nnoremap <Leader>ff :Files $PWD/<CR>
  nnoremap <Leader>fep :Files ~/MEGA/code/dotfiles<CR>
  "}
  "
  "{use Yggdroot/indentLine
  let g:indentLine_enable=1
  noremap <silent> <Leader>ii :IndentLinesToggle<cr>
  let g:indentLine_setColors = 1
  let g:indentLine_char = '┆'
  "}
  "
  " vim-indent-guides {
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
  " }
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
  " vnoremap  <C-End> >gv
  " vnoremap  <C-Home> <gv
  "}
  "{vim-scripts/loremipsum
  nnoremap <silent> <leader>gn :Loremipsum<cr>
  "}
  "{codi.vim
  noremap <silent> <localleader>cd :Codi!!<cr>
  "}
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

  noremap <silent> <C-up> :call smooth_scroll#up(&scroll, 0, 2)<CR>
  noremap <silent> <C-down> :call smooth_scroll#down(&scroll, 0, 2)<CR>
  noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
  noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
  " }
    "{dyng/ctrlsf.vim
  let g:ctrlsf_position = 'bottom'
  let g:ctrlsf_winsize = '30%'
  vmap <silent> <localleader>cf <Plug>CtrlSFVwordExec
  nmap <silent> <localleader>cf <Plug>CtrlSFCwordPath<cr>
    "}
    "
    "{fzf neoyank
  nnoremap <silent> <leader>fy :FZFNeoyank<cr>
    "} 
   "{tweekmonster/fzf-filemru
  noremap <silent> <leader>fr :FilesMru<cr>
   "}
    "{create new tab 
  nmap <leader>nb :edit 
    "}
    "
  " }
  " {open .spacevim
  noremap <silent> <leader>fed :edit ~/.spacevim<cr>
  " }
 "  {dhruvasagar/vim-table-mode
  let g:loaded_table_mode = 1
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
  let NERDTreeChDirMode=1
  noremap <silent> <leader>nc :NERDTreeCWD<cr>
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  "}
  "
  " {roxma/vim-paste-easy
  let g:paste_easy_message=0
  " }

  "{KabbAmine/zealvim.vim
  nmap <silent> <leader>gz <Plug>Zeavim
  vmap <leader>gz <Plug>ZVVisSelection
  let g:zv_disable_mapping = 1
  let g:zv_get_docset_by = ['ft']
  let g:zv_file_types = {
              \   'css'                 : 'css',
              \   'javascript'          : 'javascript,nodejs',
              \   'python'              : 'python,django',
              \ }
  "}

  "{tyru/open-browser.vim
  let g:netrw_nogx = 1 " disable netrw's gx mapping.
	nmap <leader>go <Plug>(openbrowser-smart-search)
	vmap <leader>go <Plug>(openbrowser-smart-search)
  "}

  "{tpope/vim-fugitive
  nnoremap <leader>ga :Git! add .<cr>
  "}
	
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
            \ 'css' : ['prettier'],
            \ 'python' : ['flake8'],
            \ 'markdown' : ['mdl'],
            \ 'javascript.jsx' : ['eslint'],
            \ 'javascript' : ['eslint'],
            \ 'ruby' : ['rubocop'],
            \}
  let g:ale_fixers = {
  \  'python': ['yapf'],
  \  'ruby': ['rubocop'],
  \  'javascript': ['prettier'],
  \  'json': ['prettier'],
  \  'css': ['prettier'],
  \  'markdown': ['prettier'],
  \}
  
  " file and filename copy
  " {
  nmap <leader>cp :call system("xclip -i -selection clipboard", expand("%:t"))<CR>
  nmap <leader>ap :call system("xclip -i -selection clipboard", expand("%:p"))<CR>
  nmap <leader>rp :call system("xclip -i -selection clipboard", expand("%"))<CR>
  nmap <leader>pc :call system("xclip -i -selection clipboard", expand("%:p:h"))<CR>
  " }

  " fzf
  " {

  nnoremap <silent> <leader>ct :Tags<cr>
  nnoremap <silent> <leader>fb :BTags<cr>
  nnoremap <silent> <leader>ls :Lines<cr>
  nnoremap <silent> <leader>fl :BLines<cr>
  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

  " }

  "{unimpaired-like-map
  nnoremap <silent> [<space> :pu! _<cr>:']+1<cr>
  nnoremap <silent> ]<space> :pu _<cr>:'[-1<cr>
  nnoremap <silent> ]p :pu<cr>
  nnoremap <silent> [p :pu!<cr>
  "}
  "unbind-key
  "{
  "vim swoop
  vmap <Leader>s <nop>
  nunmap <Leader>ss
  nunmap <Leader>sm

  " lucidstack/ctrlp-tmux.vim
if g:spacevim_tmux
  if spacevim#load('unite')
    nunmap <Leader>mw
    nunmap <Leader>mf
    nunmap <Leader>mm
    nunmap <Leader>md
    nunmap <Leader>mi
  endif
endif
"}
  "{mouse
  set mouse=a
  "}
  "{save all buffers
  nnoremap <silent> <leader>fS :wa!<cr>
  "
  "}
  "{vim move
  vmap <C-Down> <Plug>MoveBlockDown
  vmap <C-Up> <Plug>MoveBlockUp
  "}
  "
  "{majutsushi/tagbar
  if executable('ripper-tags')
    let g:tagbar_type_ruby = {
        \ 'kinds'      : ['m:modules',
                        \ 'c:classes',
                        \ 'C:constants',
                        \ 'F:singleton methods',
                        \ 'f:methods',
                        \ 'a:aliases'],
        \ 'kind2scope' : { 'c' : 'class',
                         \ 'm' : 'class' },
        \ 'scope2kind' : { 'class' : 'c' },
        \ 'ctagsbin'   : 'ripper-tags',
        \ 'ctagsargs'  : ['-f', '-']
        \ }
  endif
  let g:tagbar_type_css = {
  \ 'ctagstype' : 'Css',
      \ 'kinds'     : [
          \ 'c:classes',
          \ 's:selectors',
          \ 'i:identities'
      \ ]
  \ }
  let g:tagbar_type_typescript = {
    \ 'ctagstype': 'typescript',
    \ 'kinds': [
      \ 'c:classes',
      \ 'n:modules',
      \ 'f:functions',
      \ 'v:variables',
      \ 'v:varlambdas',
      \ 'm:members',
      \ 'i:interfaces',
      \ 'e:enums',
    \ ]
  \ }
   
  "}
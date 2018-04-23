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
    let g:completor_python_binary = '/usr/bin/python3' "python 
    let g:monster#completion#backend = 'solargraph'    "ruby
    let g:completor_gocode_binary='~/.go/bin/gocode' "go
    let g:completor_racer_binary='~/.cargo/bin/racer' "rust
    let g:completor_tsserver_binary = '/usr/bin/tsserver' " typescript
endif 


" snippet
" if g:spacevim_nvim || g:spacevim_vim8


 " python
  " {
  " pymode 设置
  " { python-mode
    let g:pymode_motion = 0               " motion
    let g:pymode_run = 0                  " quick run 
    let g:pymode_python = 'python3'       " version
    let g:pymode_doc = 0     "启用python-mode内置的python文档，使用K进行查找
    let g:pymode_rope = 0
  " }
    " fisadev/vim-isort
    let g:vim_isort_map = ''
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
  " autocmd BufEnter *.js setfiletype javascript
  let g:jsx_ext_required = 1
  let g:javascript_plugin_jsdoc = 1       "pangloss/vim-javascript
  
  " typescript
  let g:tsuquyomi_disable_quickfix=1

  "skywind3000/asyncrun.vim
  au FileType javascript map <silent> <F5> :AsyncRun! time node %<CR>    

  " md
  " {
  let g:livedown_autorun = 0
  nmap <silent> <leader>mdp :LivedownPreview<cr>
  nmap <silent> <leader>mdt :LivedownToggle<cr>
  " }


  "tpope/vim-eunuch
  "{rename and mkdir 
    noremap <leader>rn :Move 
    noremap <leader>cd :Mkdir 
  "}
 "
  "
  "{BufOnly 
  nnoremap <leader>bD :BufOnly<cr>
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
  " avoid buffer change the cursor scroll 
  au BufLeave * if !&diff | let b:winview = winsaveview() | endif
  au BufEnter * if exists('b:winview') && !&diff | call winrestview(b:winview) | unlet! b:winview | endif

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
   "
  " }
 "  {dhruvasagar/vim-table-mode
  let g:loaded_table_mode = 1
   "" Use this option to define the table corner character
  let g:table_mode_corner = '|'
  " Use this option to define the delimiter which used by
  let g:table_mode_delimiter = ' '
  noremap <leader>itb :Tableize<cr>
  " }
  "{codi.vim
  noremap <silent> <localleader>cd :Codi!!<cr>
  "}

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

  " ludovicchabant/vim-gutentags

  let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']


  let g:gutentags_ctags_tagfile = 'tags'
  let s:vim_tags = expand('~/.cache/tags')
  " let s:vim_tags = expand('$PWD')
  let g:gutentags_cache_dir = s:vim_tags

  let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
  let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
  let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

  if !isdirectory(s:vim_tags)
     silent! call mkdir(s:vim_tags, 'p')
  endif
  set tags=s:vim_tags;,tags
  "}

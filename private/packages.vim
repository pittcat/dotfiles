  " python
  " {
  " import 排序
    Plug 'fisadev/vim-isort'
  " }


  " web
  " {
  " html
  Plug  'alvan/vim-closetag'    "标签补全等等
  Plug  'gregsexton/matchtag'   "标签高亮
   "javascript 
  Plug  'othree/javascript-libraries-syntax.vim'
  Plug  'othree/yajs.vim'
  Plug  'othree/es.next.syntax.vim'
  " }
  "
  "
  "
  "{roxma/nvim-completion-manager---vim 配置
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/nvim-completion-manager'
  let g:python3_host_prog='/usr/bin/python3'
  let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
  let $NVIM_PYTHON_LOG_LEVEL="DEBUG"


  " javascript 
  Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}

 " snippet配置
 " {
  " vim-snippets--搭配ultisnip
  " Plug 'honza/vim-snippets'

 " 通用配置<c-y>
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" 

  " neosnippet- vim8 或者 neovim  
  let g:neosnippet#enable_completed_snippet=1
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
" Enable snipMate compatibility feature.
  " let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets--neosnippet 配合不好
  " let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'


  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  imap <expr> <Tab> (pumvisible() ? "\<C-n>" : (neosnippet#mappings#expand_or_jump_impl()!=''?neosnippet#mappings#expand_or_jump_impl():"\<Tab>"))
  smap <Tab>     <Plug>(neosnippet_expand_or_jump)  
  xmap <Tab>     <Plug>(neosnippet_expand_target)   
  " neosnippet doesn't have jump back key
  imap <expr> <S-Tab> (pumvisible() ? "\<C-p>" : "\<S-Tab>")


  " ultisnips--vim8
  " Plug 'SirVer/ultisnips'

  " let g:UltiSnipsExpandTrigger        = "<Plug>(ultisnips_expand)"
  " let g:UltiSnipsJumpForwardTrigger   = "<Plug>(ultisnips_expand)"
  " let g:UltiSnipsJumpBackwardTrigger  = "<Plug>(ultisnips_backward)"
  " let g:UltiSnipsListSnippets         = "<Plug>(ultisnips_list)"
  " let g:UltiSnipsRemoveSelectModeMappings = 0 

  " vnoremap <expr> <Plug>(ultisnip_expand_or_jump_result) g:ulti_expand_or_jump_res?'':"\<Tab>"
  " inoremap <expr> <Plug>(ultisnip_expand_or_jump_result) g:ulti_expand_or_jump_res?'':"\<Tab>"
  " imap <silent> <expr> <Tab> (pumvisible() ? "\<C-n>" : "\<C-r>=UltiSnips#ExpandSnippetOrJump()\<cr>\<Plug>(ultisnip_expand_or_jump_result)")
  " xmap <Tab> <Plug>(ultisnips_expand)
  " smap <Tab> <Plug>(ultisnips_expand)

  " vnoremap <expr> <Plug>(ultisnips_backwards_result) g:ulti_jump_backwards_res?'':"\<S-Tab>"
  " inoremap <expr> <Plug>(ultisnips_backwards_result) g:ulti_jump_backwards_res?'':"\<S-Tab>"
  " imap <silent> <expr> <S-Tab> (pumvisible() ? "\<C-p>" : "\<C-r>=UltiSnips#JumpBackwards()\<cr>\<Plug>(ultisnips_backwards_result)")
  " xmap <S-Tab> <Plug>(ultisnips_backward)
  " smap <S-Tab> <Plug>(ultisnips_backward)

  " " optional
  " inoremap <silent> <c-e> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>


  " 
 "
 "
  "}
  "
  "
  "
  "


  " tools-improve
  "sjmbbill/undotree
  "{
  Plug 'mbbill/undotree'
  let g:undotree_SplitWidth=40
  let g:undotree_SetFocusWhenToggle=1
  noremap <F2> :UndotreeToggle<cr>
  if has("persistent_undo")
      set undodir=~/.undodir/
      set undofile
  endif
  "}
  " {
  " }
  " {autosave
    Plug '907th/vim-auto-save'
    let g:auto_save = 1
    let g:auto_save_events=["InsertLeave","TextChanged"]
    let g:auto_save_write_all_buffers=1
    let g:autosave_timer=5000
  "}
  "nerdtree-tabs
  "{
  Plug 'jistr/vim-nerdtree-tabs'
  " 关闭NERDTree快捷键
  " map <leader>t :NERDTreeToggle<CR>
  " " 显示行号
  let NERDTreeShowLineNumbers=1
  let NERDTreeAutoCenter=1
  " " 是否显示隐藏文件
  let NERDTreeShowHidden=1
  " " 设置宽度
  let NERDTreeWinSize=31
  " " 在终端启动vim时，共享NERDTree
  let g:nerdtree_tabs_open_on_console_startup=1
  " " 忽略一下文件的显示
  let NERDTreeIgnore=['\.pyc','\~$','\.swp']
  " " 显示书签列表
  let NERDTreeShowBookmarks=1
  "}
  
  "auto-mkdir
  " {
  Plug  'scy/vim-mkdir-on-write'
  " }
  
  "{
  " Plug  'vim-scripts/YankRing.vim'
  "}
  "
  " gitfugitve的插件
  " {
  Plug 'mhinz/vim-signify'
  "}
  "{christoomey/vim-system-copy copy-paste-system cv cP
  Plug  'christoomey/vim-system-copy'
  "}
  "{tpope/vim-eunuch'
  Plug 'tpope/vim-eunuch'
  "}
  "{tpope/vim-repeat
  Plug  'tpope/vim-repeat'
  "}
  "{expand region
  Plug  'terryma/vim-expand-region'
  vmap V <Plug>(expand_region_expand)
  vmap v <Plug>(expand_region_shrink)
  "}
  "{
  Plug  'kien/tabman.vim'
  nnoremap <silent> <F7> :TMToggle<cr>
  "}
  "{bufferonly
   Plug 'vim-scripts/BufOnly.vim'
  "}
  "
  "{unimpaired
  Plug 'tpope/vim-unimpaired'
  "}
  "{vim-scripts/loremipsum
  Plug 'vim-scripts/loremipsum'
  "}
  "{
  Plug 'rstacruz/vim-xtract'
  vnoremap <silent> <Space>et :Xtract 
  "}
  "{
  Plug 'metakirby5/codi.vim'
  let g:codi#log='/tmp/codi.log'
  "}
  "
  "{epeli/slimux
  Plug 'epeli/slimux'
  "}
  "
  "{papanikge/vim-voogle
  Plug 'papanikge/vim-voogle'
  "}
  "{briandoll/change-inside-surroundings.vim
  Plug 'briandoll/change-inside-surroundings.vim'
  "}
 

"theme

  Plug 'rakr/vim-one'
  Plug  'kristijanhusak/vim-hybrid-material'


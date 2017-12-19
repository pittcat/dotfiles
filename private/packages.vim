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


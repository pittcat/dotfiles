if g:spacevim_nvim  " nvim
  " ncm

  Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}     " javascript
  Plug 'roxma/ncm-rct-complete'     " ruby-----gem install rcodetools

  Plug 'Shougo/neoinclude.vim'      "include completion
  Plug 'Shougo/neco-syntax'         "syntax completion
  Plug 'fgrsnau/ncm-otherbuf'       "other buffers

  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }         " deoplete------extend for ncm
  " deoplete-------extend for lang


else  "vim8
  " completor.vim
  Plug 'ferreum/completor-tmux'     "complete tmux
  Plug 'xaizek/vim-inccomplete'         "complete cpp header------improve completor
  Plug 'osyo-manga/vim-monster'     " ruby------->gem install rcodetools

endif 




" snippets
" {
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" web 
"
" Plug 'jvanja/vim-bootstrap4-snippets'       "html
Plug 'epilande/vim-react-snippets'          "react
Plug 'isRuslan/vim-es6'                     "es6
" cpp
" }


" python
" {
Plug 'fisadev/vim-isort'  " import 排序
" }


" web
" {
" html
Plug  'alvan/vim-closetag'    "标签补全等等
Plug  'gregsexton/matchtag'   "标签高亮
 "javascript 
" }
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
let NERDTreeShowLineNumbers=1 " 显示行号
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=1  " 是否显示隐藏文件
let NERDTreeWinSize=31  " 设置宽度
let g:nerdtree_tabs_open_on_console_startup=1 " 在终端启动vim时，共享NERDTree
let NERDTreeIgnore=['\.pyc','\~$','\.swp']  " 忽略一下文件的显示
let NERDTreeShowBookmarks=1 " 显示书签列表
"}

"auto-mkdir
" {
Plug  'scy/vim-mkdir-on-write'
" }

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
vnoremap <silent> <localleader>et :Xtract 
"}
"{
Plug 'metakirby5/codi.vim'
let g:codi#log='/tmp/codi.log'
"}
"
"{AndrewRadev/splitjoin.vim
Plug 'AndrewRadev/splitjoin.vim'
" gS  分离
" gJ  合并
" }
"
"{terryma/vim-smooth-scroll
Plug 'terryma/vim-smooth-scroll'

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
"{AndrewRadev/linediff.vim
Plug 'AndrewRadev/linediff.vim'
"}
"{
Plug 'justinmk/vim-gtfo'
" got--------->terminal or tmux
" gof--------->file manager
"}
"
"{iamcco/dict.vim
Plug 'iamcco/dict.vim'
"}
"{dyng/ctrlsf.vim
Plug 'dyng/ctrlsf.vim'
"}
"{fzf neoyank
Plug 'justinhoward/fzf-neoyank'
Plug 'Shougo/neoyank.vim'
"}
"
"{
Plug 'Shougo/neopairs.vim'
"}
"{
Plug 'osyo-manga/vim-brightest'             "当前单词下划线 
"}
"{
Plug 'chr4/nginx.vim'                 "nginx高亮
"}
"
"theme
Plug 'junegunn/seoul256.vim'
Plug 'rakr/vim-one'
Plug 'kristijanhusak/vim-hybrid-material'

Plug 'enricobacis/vim-airline-clock'
let g:airline#extensions#clock#format = '%H:%M:%S'
let g:airline#extensions#clock#updatetime = 1000

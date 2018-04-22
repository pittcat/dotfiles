if g:spacevim_nvim  " nvim

  " deoplete lang
  Plug 'wellle/tmux-complete.vim'
  Plug 'zchee/deoplete-jedi',{'for': 'python'}
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern','for':['javascript','vue','javascript.jsx']}
  " Plug 'zchee/deoplete-clang',{ 'for': ['c', 'cpp']}
  " Plug 'mhartington/nvim-typescript',{'for':'typescript'}
  " Plug 'uplus/deoplete-solargraph',{'for':'ruby','do':'gem install solargraph && pip install solargraph-utils.py --user'}
  " Plug 'sebastianmarkow/deoplete-rust',{'for':'rust'}
  Plug 'zchee/deoplete-zsh',{'for':'zsh'}


  " common 
  Plug 'Shougo/neoinclude.vim'      "include completion
  Plug 'Shougo/neco-syntax'         "syntax completion

else  "vim8
  " completor.vim
  Plug 'xaizek/vim-inccomplete',{'for':['c','cpp']}
  " Plug 'osyo-manga/vim-monster',{'for':'ruby','do':'gem install solargraph'}     " ruby------->gem install solargraph
  " Plug 'maralla/completor-typescript'

endif 


" snippets
" {

" web 
"
" Plug 'jvanja/vim-bootstrap4-snippets'       "html
Plug 'epilande/vim-react-snippets'          "react
Plug 'isRuslan/vim-es6'                     "es6
" cpp
" }


" python
" {
Plug 'fisadev/vim-isort',{'for':'python'}  " import 排序
Plug 'jmcomets/vim-pony'  " django jump and command
" }


" web
" {
" html
Plug  'alvan/vim-closetag',{'for':'html'}  "标签补全等等
Plug  'gregsexton/matchtag'   "标签高亮
"javascript 
" }
"
"php
" {
" Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }           "autocomplete
" Plug 'StanAngeloff/php.vim'               "高亮
" Plug '2072/PHP-Indenting-for-VIm'         "缩进
" }
"
" ruby
" {
  " Plug 'tpope/vim-rails'
  " Plug 'tpope/vim-endwise', { 'for': 'ruby' }
" }
"
"markdownd
" {
  Plug 'shime/vim-livedown',{'for':'markdown'}
  " Plug 'suan/vim-instant-markdown',{'do':'npm install -g instant-markdown-d'}
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

" {autosave
Plug '907th/vim-auto-save'
let g:auto_save = 1
let g:auto_save_events=["InsertLeave","TextChanged","QuitPre"]
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
"{vim-scripts/loremipsum
Plug 'vim-scripts/loremipsum'
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
"{dyng/ctrlsf.vim
Plug 'dyng/ctrlsf.vim'
"}
"{fzf neoyank
Plug 'justinhoward/fzf-neoyank'
Plug 'Shougo/neoyank.vim'
"}
"{
Plug 'tweekmonster/fzf-filemru'
"}
"
"{
Plug 'chr4/nginx.vim'                 "nginx高亮
"}
"{dhruvasagar/vim-table-mode
Plug 'dhruvasagar/vim-table-mode',{'for':'markdown'}
"}
"{dietsche/vim-lastplace
Plug 'dietsche/vim-lastplace'
"}
" {metakirby5/codi.vim
Plug 'metakirby5/codi.vim'
" }
" {lilydjwg/fcitx.vim
Plug 'lilydjwg/fcitx.vim'
" }
" {roxma/vim-paste-easy
Plug 'roxma/vim-paste-easy'
" }
"{KabbAmine/zeavim.vim
Plug 'KabbAmine/zeavim.vim'
"}
"{tyru/open-browser.vim
Plug 'tyru/open-browser.vim'
"}
"themefor
Plug 'rakr/vim-one'
Plug 'mhinz/vim-janah'
Plug 'junegunn/seoul256.vim'


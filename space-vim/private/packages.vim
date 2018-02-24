if g:spacevim_nvim  " nvim

  " deoplete lang
  Plug 'wellle/tmux-complete.vim'
  Plug 'zchee/deoplete-jedi',{'for': 'python'}
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern','for':'javascript'}
  Plug 'zchee/deoplete-clang',{ 'for': ['c', 'cpp']}
  Plug 'mhartington/nvim-typescript',{'for':'typescript'}
  " Plug 'uplus/deoplete-solargraph',{'for':'ruby'}
  Plug 'sebastianmarkow/deoplete-rust',{'for':'rust'}
  " ncm
  " Plug 'roxma/nvim-completion-manager'
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }         " deoplete------extend for ncm
  " Plug 'fgrsnau/ncm-otherbuf'       "other buffers

  " ncm lang 
  " Plug 'roxma/nvim-cm-tern',  {'do': 'npm install','for':'javascript'}     " javascript
  " Plug 'roxma/ncm-rct-complete'     " ruby-----gem install rcodetools


  " common 
  Plug 'Shougo/neoinclude.vim'      "include completion
  Plug 'Shougo/neco-syntax'         "syntax completion

else  "vim8
  " completor.vim
  Plug 'ferreum/completor-tmux'     "complete tmux
  " Plug 'osyo-manga/vim-monster',{'for':'ruby'}     " ruby------->gem install rcodetools
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
Plug 'turbio/bracey.vim',{'do':'npm install --prefix server','for':'html'}
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
  Plug 'shime/vim-livedown',{'do':'npm install -g livedown','for':'markdown'}
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
"{
Plug 'tweekmonster/fzf-filemru'
"}
"
"{
Plug 'chr4/nginx.vim'                 "nginx高亮
"}
"{project index grep
Plug 'wsdjeg/FlyGrep.vim'
"}
"{dhruvasagar/vim-table-mode
Plug 'dhruvasagar/vim-table-mode',{'for':'markdown'}
"}
"{dietsche/vim-lastplace
Plug 'dietsche/vim-lastplace'
"}
"{vim lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
" Plug 'felixfbecker/php-language-server', {'do': 'composer install && composer run-script parse-stubs'}          "php
"}
" {metakirby5/codi.vim
Plug 'metakirby5/codi.vim'
" }
"themefor
Plug 'rakr/vim-one'
Plug 'sickill/vim-monokai'
Plug 'mhinz/vim-janah'


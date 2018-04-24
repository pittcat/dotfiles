function! s:delay(...)
  " Ignore unknown plugins from vim-plug due to the excluded plugins
  for l:plug in a:000
    silent! call plug#load(l:plug)
  endfor
endfunction


function! Delayfilemanager(timer) abort
  call s:delay('mbbill/undotree','907th/vim-auto-save','jistr/vim-nerdtree-tabs','mhinz/vim-signify','tpope/vim-eunuch','justinmk/vim-gtfo')
endfunction

function! Delaycopy_and_paste(timer) abort
  call s:delay('justinhoward/fzf-neoyank','Shougo/neoyank.vim','christoomey/vim-system-copy','tweekmonster/fzf-filemru','roxma/vim-paste-easy')
endfunction


function! Delayoperation_freestyle(timer) abort
  call s:delay('tpope/vim-repeat','terryma/vim-expand-region','kien/tabman.vim','vim-scripts/BufOnly.vim','vim-scripts/loremipsum','AndrewRadev/splitjoin.vim','terryma/vim-smooth-scroll','briandoll/change-inside-surroundings.vim','AndrewRadev/linediff.vim','dyng/ctrlsf.vim')
endfunction

function! Delayawesome_tools(timer) abort
  call s:delay('chr4/nginx.vim','dhruvasagar/vim-table-mode','dietsche/vim-lastplace','metakirby5/codi.vim','lilydjwg/fcitx.vim','KabbAmine/zeavim.vim','tyru/open-browser.vim','ludovicchabant/vim-gutentags')
endfunction


if g:spacevim_timer
"sjmbbill/undotree
"{
MP 'mbbill/undotree'
let g:undotree_SplitWidth=40
let g:undotree_SetFocusWhenToggle=1
noremap <F2> :UndotreeToggle<cr>
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif
"}

" {autosave
MP '907th/vim-auto-save'
let g:auto_save = 1
let g:auto_save_events=["InsertLeave","TextChanged","QuitPre"]
let g:auto_save_write_all_buffers=1
let g:autosave_timer=5000
"}
"nerdtree-tabs
"{
MP 'jistr/vim-nerdtree-tabs'
let NERDTreeShowLineNumbers=1 " 显示行号
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=1  " 是否显示隐藏文件
let NERDTreeWinSize=31  " 设置宽度
let g:nerdtree_tabs_open_on_console_startup=1 " 在终端启动vim时，共享NERDTree
let NERDTreeIgnore=['\.pyc','\~$','\.swp']  " 忽略一下文件的显示
let NERDTreeShowBookmarks=1 " 显示书签列表
"}

" gitfugitve的插件
" {
MP 'mhinz/vim-signify'
"}
"{tpope/vim-eunuch'
MP 'tpope/vim-eunuch'
"}
"{
MP 'justinmk/vim-gtfo'
" got--------->terminal or tmux
" gof--------->file manager
"}

call timer_start(750,"Delayfilemanager")


" copy pase and so on

"{fzf neoyank
MP 'justinhoward/fzf-neoyank'
MP 'Shougo/neoyank.vim'
"}
"{christoomey/vim-system-copy copy-paste-system cv cP
MP 'christoomey/vim-system-copy'
"}
"{
MP 'tweekmonster/fzf-filemru'
"}
" {roxma/vim-paste-easy
MP 'roxma/vim-paste-easy'
" }

call timer_start(850,'Delaycopy_and_paste')


"{tpope/vim-repeat
MP 'tpope/vim-repeat'
"}
"{expand region
MP 'terryma/vim-expand-region'
vmap V <Plug>(expand_region_expand)
vmap v <Plug>(expand_region_shrink)
"}
"{
MP 'kien/tabman.vim'
nnoremap <silent> <F7> :TMToggle<cr>
"}
"{bufferonly
MP 'vim-scripts/BufOnly.vim'
"}
"
"{vim-scripts/loremipsum
MP 'vim-scripts/loremipsum'
"}
"
"{AndrewRadev/splitjoin.vim
MP 'AndrewRadev/splitjoin.vim'
" gS  分离
" gJ  合并
" }
"
"{terryma/vim-smooth-scroll
MP 'terryma/vim-smooth-scroll'

"}
"
"{briandoll/change-inside-surroundings.vim
MP 'briandoll/change-inside-surroundings.vim'
"}
"{AndrewRadev/linediff.vim
MP 'AndrewRadev/linediff.vim'
"}
"
"{dyng/ctrlsf.vim
MP 'dyng/ctrlsf.vim'
"}
call timer_start(950,'Delayoperation_freestyle')

"{
MP 'chr4/nginx.vim'                 "nginx高亮
"}
"{dhruvasagar/vim-table-mode
MP 'dhruvasagar/vim-table-mode',{'for':'markdown'}
"}
"{dietsche/vim-lastplace
MP 'dietsche/vim-lastplace'
"}
" {metakirby5/codi.vim
MP 'metakirby5/codi.vim'
" }
" {lilydjwg/fcitx.vim
MP 'lilydjwg/fcitx.vim'
" }
"{KabbAmine/zeavim.vim
MP 'KabbAmine/zeavim.vim'
"}
"{tyru/open-browser.vim
MP 'tyru/open-browser.vim'
"}
"{ludovicchabant/vim-gutentags
MP 'ludovicchabant/vim-gutentags'
"}
call timer_start(1400,'Delayawesome_tools')

endif

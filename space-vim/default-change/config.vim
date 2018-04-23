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
"{tags config
"majutsushi/tagbar
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

" { multiple cursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-u>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" }

"{Limelight and goyo
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg='gray'
let g:limelight_conceal_ctermfg=240
let g:limelight_default_coefficient=0.7
"
"}
" { mhinz/vim-startify
let g:startify_session_persistence = 1
noremap <silent> <leader>sv :SSave<cr>
noremap <silent> <leader>sr :SLoad<cr>
" }
"{airblade/vim-rooter
let g:rooter_change_directory_for_non_project_files = 'current'
"}
"{scrooloose/nerdtree
nnoremap <silent> <F4> :NERDTreeToggle<CR>
inoremap <silent> <F4> <ESC>:NERDTreeToggle<CR>
nnoremap <silent> <Leader>ft :NERDTreeToggle<CR>
nnoremap <silent> <Leader>fd :NERDTreeFind<CR>
let NERDTreeChDirMode=1
noremap <silent> <leader>nc :NERDTreeCWD<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"}
"
"{tpope/vim-fugitive
nnoremap <leader>ga :Git! add .<cr>
"}
"{gv.vim
noremap <silent> <leader>cg :GV<cr>
"}
"{justinmk/vim-sneak
map f <Plug>Sneak_s
map F <Plug>Sneak_S
"}
"{FZF
nnoremap <Leader>f? :Files ~<CR>
nnoremap <Leader>ff :Files $PWD/<CR>
nnoremap <Leader>fep :Files ~/MEGA/code/dotfiles<CR>
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


"}
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

"unbind-key for exluded plugins
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
"{
autocmd BufEnter spacevim setfiletype vim
"}

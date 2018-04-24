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

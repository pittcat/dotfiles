if g:spacevim_timer
  MP 'junegunn/fzf',  { 'dir': '~/.fzf', 'do': './install --all', 'on': [] }
  MP 'junegunn/fzf.vim', { 'on': [] }
  call timer_start(450, 'spacevim#defer#fzf')
else
  MP 'junegunn/fzf',  { 'dir': '~/.fzf', 'do': './install --all' }
  MP 'junegunn/fzf.vim'
endif

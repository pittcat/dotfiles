if g:spacevim_nvim
  MP 'Shougo/deoplete.nvim',{ 'do': ':UpdateRemotePlugins'  }
  " MP 'roxma/nvim-completion-manager'
elseif g:spacevim_vim8
  MP 'maralla/completor.vim',{'do': 'cd pythonx/completers/javascript && npm install'}
  MP 'ferreum/completor-tmux'     "complete tmux
else
  MP 'Shougo/neocomplete.vim'
endif

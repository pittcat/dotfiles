" ~/.config/nvim/ginit.vim 

if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'Noto Mono for Powerline Bold 12')
  call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
  call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
  call rpcnotify(1, 'Gui', 'Option', 'Cmdline', 1)
endif


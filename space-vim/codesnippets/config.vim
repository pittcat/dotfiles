scriptencoding utf-8

if g:spacevim_nvim || g:spacevim_vim8
  let g:UltiSnipsSnippetDirectories=['UltiSnips']
  exe 'set rtp+=' . expand(g:spacevim_dir . '/private/UltiSnips')
  if g:spacevim_vim8
    let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
  endif
  if g:spacevim_nvim
    let g:UltiSnipsSnippetsDir =  '~/.config/nvim/UltiSnips'
  endif
  let g:UltiSnipsRemoveSelectModeMappings = 0

  let g:UltiSnipsJumpForwardTrigger = '<C-j>'
  let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
  let g:UltiSnipsExpandTrigger = "<C-e>"
  let g:ulti_expand_res = 0
  function ExpandSnippetOrCarriageReturn()
      let snippet = UltiSnips#ExpandSnippet()
      if g:ulti_expand_res > 0
          return snippet
      elseif g:spacevim_vim8
          return "\<C-y>"
      else 
        return deoplete#close_popup()
      endif
  endfunction

  inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

  if !empty(glob("$HOME/.vim/plugged/YouCompleteMe"))
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    let g:UltiSnipsExpandTrigger = "<tab>"
  endif
  

  inoremap <expr> <down> pumvisible() ? "\<C-n>" : "\<down>"
  inoremap <expr> <up> pumvisible() ? "\<C-p>" : "\<up>"


  if g:spacevim_nvim
    if !empty(glob("$HOME/.local/share/nvim/plugged/nvim-completion-manager"))
      let g:UltiSnipsRemoveSelectModeMappings = 0
      inoremap <silent> <c-l> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
      xmap <c-l> <Plug>(ultisnips_expand)
      smap <c-l> <Plug>(ultisnips_expand)
      
      inoremap <expr> <down> pumvisible() ? "\<C-e>\<down>" : "\<down>"
      inoremap <expr> <up>  pumvisible() ?  "\<C-e>\<up>" : "\<up>"
      inoremap <expr> <left> pumvisible() ? "\<C-e>\<left>" : "\<left>"
      inoremap <expr> <right> pumvisible() ? "\<C-e>\<right>" : "\<right>"

      " if strlen(expand('<cword>'))>=1
      " if matchstr(getline('.'), '\%' . col('.') . 'c.') !=''
    endif

  endif

endif


scriptencoding utf-8

if g:spacevim_nvim || g:spacevim_vim8
  let g:UltiSnipsUsePythonVersion = 3
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
  function! ExpandSnippetOrCarriageReturn()
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
  function! TabJumpNext()
   let snippet=UltiSnips#JumpForwards()
   if pumvisible()==0
     if g:ulti_jump_forwards_res==1
       return snippet
     else
       return "\<tab>"
     endif
   endif
  endfunction
  inoremap <expr> <tab> pumvisible() ? "<C-n>" : "<C-R>=TabJumpNext()<CR>"

  function! STabJumpBack()
   let snippet=UltiSnips#JumpBackwards()
   if pumvisible()==0
     if g:ulti_jump_backwards_res==1
       return snippet
     else
       return "\<s-tab>"
     endif
   endif
  endfunction

  inoremap <expr> <s-tab> pumvisible() ? "<C-p>" : "<C-R>=STabJumpBack()<CR>"

  smap <TAB>   <Esc>:call UltiSnips#JumpForwards()<CR>
  smap <S-TAB> <Esc>:call UltiSnips#JumpBackwards()<CR>

  if !empty(glob("$HOME/.vim/plugged/YouCompleteMe"))
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    let g:UltiSnipsExpandTrigger = "<tab>"
  endif
  


endif


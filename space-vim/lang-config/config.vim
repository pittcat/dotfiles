
 " python
  " {
  " pymode 设置
  " { python-mode
    let g:pymode_motion = 0               " motion
    let g:pymode_run = 0                  " quick run 
    let g:pymode_python = 'python3'       " version
    let g:pymode_doc = 0     "启用python-mode内置的python文档，使用K进行查找
    let g:pymode_rope = 0
  " }
    " fisadev/vim-isort
    let g:vim_isort_map = ''
    let g:vim_isort_python_version = 'python3'
    autocmd BufLeave *.py Isort
    " skywind3000/asyncrun.vim <F5> 快捷键运行
    let g:spacevim_python_run = 'python3'
  " }

 " web
  " {
  " html
  let g:user_emmet_leader_key='<C-e>'
  let g:user_emmet_settings = {
    \  'javascript.jsx' : {
      \      'extends' : 'jsx',
      \  },
    \}            "emmet 


  let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx"       "auto-closetag添加对jsx等的支持
   "javascript
  " autocmd BufEnter *.js setfiletype javascript
  let g:jsx_ext_required = 1
  let g:javascript_plugin_jsdoc = 1       "pangloss/vim-javascript
  
  " typescript
  let g:tsuquyomi_disable_quickfix=1

  "skywind3000/asyncrun.vim
  au FileType javascript map <silent> <F5> :AsyncRun! time node %<CR>    

  " md
  " {
  let g:livedown_autorun = 0
  nmap <silent> <leader>mdp :LivedownPreview<cr>
  nmap <silent> <leader>mdt :LivedownToggle<cr>
  " }




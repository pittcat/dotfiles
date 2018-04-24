if g:spacevim_nvim

  autocmd InsertEnter * call deoplete#enable()
  

  " deoplete-------lang extend
  let g:tmuxcomplete#trigger = ''     "  'wellle/tmux-complete.vim'
  let g:deoplete#sources#jedi#python_path='/usr/bin/python3'  "zchee/deoplete-jedi
  let g:deoplete#sources#jedi#server_timeout=100
  let g:deoplete#sources#jedi#debug_server=1
  let g:deoplete#sources#ternjs#tern_bin = '/usr/bin/tern'    " carlitux/deoplete-ternjs
  let g:deoplete#sources#ternjs#filetypes = [
                  \ 'javascript',
                  \ 'jsx',
                  \ 'javascript.jsx',
                  \ 'vue',
                  \ ]
  let g:nvim_typescript#server_path='/usr/bin/tsserver'       " mhartington/nvim-typescript
  let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'   "zchee/deoplete-clang
  let  g:deoplete#sources#clang#clang_header='/usr/lib/clang'
  let g:deoplete#sources#rust#racer_binary='/home/pittcat/.cargo/bin/racer'          "sebastianmarkow/deoplete-rust
  let g:deoplete#sources#rust#rust_source_path='/home/pittcat/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'                "echo `rustc --print sysroot`/lib/rustlib/src/rust/src
  let g:deoplete#sources#rust#documentation_max_height=30

  " deoplete-common
  let g:python3_host_prog ='/usr/bin/python3'   "nvim path 
  let g:python_host_prog ='/usr/bin/python'   "nvim path 


  call deoplete#custom#source('LanguageClient','mark', 'ℰ')
  call deoplete#custom#source('omni',          'mark', '⌾')
  call deoplete#custom#source('flow',          'mark', '⌁')
  call deoplete#custom#source('TernJS',        'mark', '⌁')
  call deoplete#custom#source('go',            'mark', '⌁')
  call deoplete#custom#source('jedi',          'mark', '⌁')
  call deoplete#custom#source('vim',           'mark', '⌁')
  call deoplete#custom#source('ultisnips',     'mark', '⌘')
  call deoplete#custom#source('around',        'mark', '↻')
  call deoplete#custom#source('buffer',        'mark', 'ℬ')
  call deoplete#custom#source('tmux-complete', 'mark', '⊶')
  call deoplete#custom#source('syntax',        'mark', '♯')
  call deoplete#custom#source('member',        'mark', '.')

  call deoplete#custom#source('LanguageClient', 'rank', 100)    " change the languageclient ranking
  call deoplete#custom#source('ultisnips', 'rank', 1000)    " change the snippet ranking
  call deoplete#custom#option('ignore_sources', {'_': ['LanguageClient']})    " disable LC


  

else    "vim8
    let g:completor_clang_binary='/usr/bin/clang' "c++
    let completor_node_binary='/usr/bin/node'   "javascript
    let g:completor_python_binary = '/usr/bin/python3' "python 
    let g:monster#completion#backend = 'solargraph'    "ruby
    let g:completor_gocode_binary='~/.go/bin/gocode' "go
    let g:completor_racer_binary='~/.cargo/bin/racer' "rust
    let g:completor_tsserver_binary = '/usr/bin/tsserver' " typescript
endif 


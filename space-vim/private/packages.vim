if g:spacevim_nvim  " nvim

  " deoplete lang
  Plug 'wellle/tmux-complete.vim'
  Plug 'zchee/deoplete-jedi',{'for': 'python'}
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern','for':['javascript','vue','javascript.jsx']}
  " Plug 'zchee/deoplete-clang',{ 'for': ['c', 'cpp']}
  " Plug 'mhartington/nvim-typescript',{'for':'typescript'}
  " Plug 'uplus/deoplete-solargraph',{'for':'ruby','do':'gem install solargraph && pip install solargraph-utils.py --user'}
  " Plug 'sebastianmarkow/deoplete-rust',{'for':'rust'}
  Plug 'zchee/deoplete-zsh',{'for':'zsh'}


  " common 
  Plug 'Shougo/neoinclude.vim'      "include completion
  Plug 'Shougo/neco-syntax'         "syntax completion

else  "vim8
  " completor.vim
  Plug 'xaizek/vim-inccomplete',{'for':['c','cpp']}
  " Plug 'osyo-manga/vim-monster',{'for':'ruby','do':'gem install solargraph'}     " ruby------->gem install solargraph
  " Plug 'maralla/completor-typescript'

endif 


" snippets
" {

" web 
"
" Plug 'jvanja/vim-bootstrap4-snippets'       "html
Plug 'epilande/vim-react-snippets'          "react
Plug 'isRuslan/vim-es6'                     "es6
" cpp
" }

"themefor
Plug 'junegunn/seoul256.vim'

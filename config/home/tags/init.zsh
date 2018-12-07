# tags
yay -S universal-ctags-git cscope global
pip install pygments --user
mkdir -p ~/.ctags.d/
ln -s $PWD/tags ~/.ctags.d/.ctags


ln -s $PWD/ctags ~/.ctags
ln -s $PWD/gtags.conf /usr/share/gtags

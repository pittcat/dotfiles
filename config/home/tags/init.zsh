# tags
yay -S universal-ctags-git cscope global
pip install pygments --user
mkdir -p ~/.ctags.d/

ln -s $PWD/ctags ~/.ctags
if [ -d "/usr/share/gtags/gtags.conf" ] ; then
sudo rm /usr/local/share/gtags/gtags.conf
fi
sudo ln -s $PWD/gtags.conf /usr/local/share/gtags

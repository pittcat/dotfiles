curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python

if [ -d "$HOME/.emacs.d" ] ; then
  md ~/.emacs.d
fi

cp *[^sh] ~/.emacs.d -r

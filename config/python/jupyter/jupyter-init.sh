sudo pip install jupyter pyecharts
# sudo jupyter labextension install jupyterlab_vim jupyterlab-drawio @oriolmirosa/jupyterlab_materialdarker

# vim-bind
# Create required directory in case (optional)
mkdir -p $(jupyter --data-dir)/nbextensions
# Clone the repository
cd $(jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
# Activate the extension
jupyter nbextension enable vim_binding/vim_binding

# theme
sudo pip install jupyterthemes

sudo pip install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
jupyter nbextension enable codefolding/main


ln -s $pwd/custom.js  ~/.jupyter/custom/custom.js

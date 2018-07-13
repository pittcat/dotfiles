# chmod a+x jupyter-init.sh


pip install jupyter pyecharts
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
pip install jupyterthemes
jt -t solarizedd -vim

pip install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
jupyter nbextension enable codefolding/main

# jupyter board
pip install jupyter_dashboards
jupyter dashboards quick-setup --sys-prefix
jupyter nbextension install --py jupyter_dashboards --sys-prefix
jupyter nbextension enable --py jupyter_dashboards --sys-prefix

ln -s $pwd/custom.js  ~/.jupyter/custom/custom.js

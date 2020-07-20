# chmod a+x jupyter-init.sh

sudo pacman -S pandoc python-qtconsole
sudo pip install jupyter pyecharts 
pip install jupyter pyecharts --user
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
pip install pixiedust --user
jt -t gruvboxl -T -vim -nfs 11 -fs 13 -f firacode -cellw 92%

sudo pip install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
jupyter nbextension enable codefolding/main
jupyter nbextension enable --py latex_envs

# jupyter board
sudo pip install jupyter_dashboards
sudo jupyter dashboards quick-setup --sys-prefix
sudo jupyter nbextension install --py jupyter_dashboards --sys-prefix
sudo jupyter nbextension enable --py jupyter_dashboards --sys-prefix

# jupytext
pip install jupytext --upgrade

# nbdime
pip install nbdime --user
jupyter serverextension enable --py nbdime --user
jupyter nbextension install --py nbdime --user
jupyter nbextension enable --py nbdime --user


rm ~/.jupyter/jupyter_notebook_config.*
ln -s $PWD/jupyter_notebook_config.py ~/.jupyter/
ln -s $PWD/jupyter_notebook_config.json ~/.jupyter/

rm ~/.jupyter/custom/custom.js
ln -s $PWD/custom.js  ~/.jupyter/custom/custom.js

ln -s $PWD/jupyter_qtconsole_config.py ~/.jupyter/jupyter_qtconsole_config.py

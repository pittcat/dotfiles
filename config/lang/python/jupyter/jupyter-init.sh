# chmod a+x jupyter-init.sh

sudo pacman -S pandoc python-qtconsole jupyter jupytext
sudo pip install jupyter pyecharts 

ln -s $PWD/jupyter_qtconsole_config.py ~/.jupyter/jupyter_qtconsole_config.py

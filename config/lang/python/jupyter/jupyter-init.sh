# chmod a+x jupyter-init.sh

sudo pacman -S pandoc python-qtconsole jupyter jupytext
sudo pip install jupyter pyecharts 

pip install --upgrade jupyterthemes

jt -t onedork -T -vim -nfs 16 -fs 16  -f firacode -cellw 92%

ln -s $PWD/jupyter_qtconsole_config.py ~/.jupyter/jupyter_qtconsole_config.py

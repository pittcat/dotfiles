# python vim  config and include following config
sudo touch /etc/pip.conf
mkdir -p ~/.ptpython
ln -s $PWD/config.py ~/.ptpython/config.py
echo "[global]\nindex-url = https://pypi.tuna.tsinghua.edu.cn/simple" | sudo tee /etc/pip.conf

sudo pip3 install -r $PWD/requirements.txt


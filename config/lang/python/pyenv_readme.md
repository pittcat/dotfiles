# pyenv and pipenv

## prerequisite

yay -S pyenv
export v=3.8.6; wget https://npm.taobao.org/mirrors/python/$v/Python-$v.tar.xz -P ~/.pyenv/cache/; pyenv install $v

**常用命令：**

```
pyenv local py-version
pyenv global py-version
pyenv virtualenv py-version(3.9.6) py396
pyenv activate py396
```

pyenv 的介绍：https://realpython.com/intro-to-pyenv/

[pyenv](https://github.com/pyenv/pyenv)

[pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)

## 设置 PYTHONPATH

show python packages path to change

python -c "import sys; print(sys.path)"

## combine with direnv

1. direnv 主要是清零和设置环境变量(必须设置 PYTHONPATH,
   不然会使得本地模块无法在运行时被识别)

在虚拟环境下，使用如下命令，查看 PYTHONPATH

```
python -c "import sys; print(sys.path)"
```

```
unset PYTHONPATH
export PYTHONPATH=$PYTHONPATH:$HOME/.pyenv/versions/py396/lib/python3.9/site-packages
nvim会读取环境变量，清除环境变量的话，nvim补全python会出现库和runtime不匹配
```

2. direnv allow .

## migrate

src export:
pip freeze > requirements.txt

dst import:
pip install -r requirements.txt

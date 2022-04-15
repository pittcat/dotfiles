# pyenv and pipenv

## prerequisite
yay -S pyenv
export v=3.8.6; wget https://npm.taobao.org/mirrors/python/$v/Python-$v.tar.xz -P ~/.pyenv/cache/; pyenv install $v 

pyenv local py-version

pyenv的介绍：https://realpython.com/intro-to-pyenv/

## show python packages path to change
python -c "import sys; print(sys.path)"


## pipenv

https://realpython.com/pipenv-guide/

也许可以考虑和pipenv联合使用(版本问题)

## combine with direnv

direnv allow .

```
unset PYTHONPATH  
```

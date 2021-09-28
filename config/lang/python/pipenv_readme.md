## prerequisite
yay -S pyenv
export v=3.8.6; wget https://npm.taobao.org/mirrors/python/$v/Python-$v.tar.xz -P ~/.pyenv/cache/; pyenv install $v 

## show python packages path to change
python -c "import sys; print(sys.path)"

## combine with direnv

```
unset PYTHONPATH  
```

也许可以考虑和pipenv联合使用

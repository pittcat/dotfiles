# pyenv

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
nvim会读取环境变量，不清除环境变量的话，nvim补全python会出现库和runtime不匹配
```

2. direnv allow .

## migrate

src export:
pip freeze > requirements.txt

dst import:
pip install -r requirements.txt

## 比对 conda

`pyenv activate py396`之后，neovim 的 floaterm,以及 dap
都是可以读到 python 版本和对应的环境变量的，但是使用 conda 不可以。
如果一个环境不是针对 ML，优先选用 pyenv。

conda 环境如果想要 neovim 的 floaterm 和 dap 能够读取到 python 版本以及环境变量需要如下操作

1. conda 激活环境，并且用 direnv 控制环境变量
2. 在 floaterm 中，使用

```
conda activate py-virtualenv && source .envrc
```

3. dap 的配置,思路主要是通过.lvimrc 改变 dap adapter 的配置

```
.lvimrc

luafile linit.lua

linit.lua

local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = '/home/kingerzee/anaconda3/envs/py396/bin/python3.9';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file in integratedTerminal",
		program = "${fileDirname}/${fileBasename}",
    cwd = "/home/kingerzee/pittcat/lab-project",
		console = "integratedTerminal",
	}
}

```

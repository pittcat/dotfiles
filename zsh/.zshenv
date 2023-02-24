# if hash ifconfig 2>/dev/null; then
#     export LOCAL_IP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'`
# fi
export GREP_OPTIONS='--color=auto'
# set default editor
export EDITOR='/usr/bin/nvim'
export VISUAL='/usr/bin/nvim'

# direnv 
# Add direnv hook
if hash direnv 2>/dev/null; then
    eval "$(direnv hook zsh)"
fi
export DIRENV_LOG_FORMAT=   # remove direnv log loading

export PATH=$PATH:$HOME/.local/bin

# python
export PYTHONPATH=$PYTHONPATH:$HOME/.local/lib/python3.10/site-packages:/usr/lib/python3.10/site-packages
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


# js
export NVM_COMPLETION=true
export NVM_NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node/"


# rust
if [ -d "$HOME/.cargo/bin" ] ; then
    PATH=$PATH:$HOME/.cargo/bin
    export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
    export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
    export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src/
    . "$HOME/.cargo/env"
fi


export PATH=$PATH:$HOME/.local/share/neovim/bin

export fpath=($HOME/.fpath $fpath)
# fzf
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=180'


# LANG
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

if hash ifconfig 2>/dev/null; then
    export LOCAL_IP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'`
fi
# set default editor
export EDITOR='/usr/bin/nvim'
export VISUAL='/usr/bin/nvim'

# zsh pj setting
export PROJECT_PATHS=(~/MEGA/code)

# direnv 
# Add direnv hook
if hash direnv 2>/dev/null; then
    eval "$(direnv hook zsh)"
fi
export DIRENV_LOG_FORMAT=   # remove direnv log loading

export PATH=$PATH:$HOME/.local/bin

# python
export PYTHONPATH=$PYTHONPATH:$HOME/.local/lib/python3.8/site-packages:/usr/lib/python3.8/site-packages

# nodejs
export NPM_CONFIG_PREFIX=$HOME/.npm-global
export PATH=$PATH:$NPM_CONFIG_PREFIX/bin
if hash yarn 2>/dev/null; then
    export PATH="$(yarn global bin):$PATH"
fi
# vim--deoplete tern 
ulimit -n 2048

# rust
if [ -d "$HOME/.cargo/bin" ] ; then
    PATH=$PATH:$HOME/.cargo/bin
    export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
    export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
fi

# ruby
if [[ -d "$HOME/.rbenv/bin" ]]; then
    export PATH=$PATH:$HOME/.rbenv/bin
    eval "$(rbenv init -)"
fi

# if hash ruby 2> /dev/null; then
    # GEM_HOME=$(ls -t -U | ruby -e 'puts Gem.user_dir')
    # if [[ -d "$GEM_HOME/bin" ]]; then
    # PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"
    # PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
    # fi
# fi

# java
if hash javac 2>/dev/null; then
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
    export PATH=$JAVA_HOME/bin:$PATH
fi


# golang
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

#php
if hash composer 2>/dev/null; then
    export COMPOSER_HOME=$HOME/.composer
    export PATH="$PATH:$HOME/.composer/vendor/bin"
fi

# deoplete zsh
zmodload zsh/zpty
export fpath=($HOME/.fpath $fpath)
# cask
export PATH=$PATH:$HOME/.cask/bin
# conda
# https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/
export PATH="$HOME/.miniconda/bin:$PATH"
# fzf
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
# gtags
export GTAGSLABEL=native-pygments
export GTAGSCONF=/usr/local/share/gtags/gtags.conf

# conda
export PATH=$PATH:$HOME/.miniconda3/bin
export NNN_USE_EDITOR=1

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=180'
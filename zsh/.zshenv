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
export PYTHONPATH=$PYTHONPATH:$HOME/.local/lib/python3.9/site-packages:/usr/lib/python3.9/site-packages

# nodejs
export NPM_CONFIG_PREFIX=$HOME/.npm-global
export PATH=$PATH:$NPM_CONFIG_PREFIX/bin
if hash yarn 2>/dev/null; then
    export PATH="$(yarn global bin):$PATH"
fi

# golang
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
export GO111MODULE=auto

export fpath=($HOME/.fpath $fpath)
# fzf
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
# gtags
export GTAGSLABEL=native-pygments
export GTAGSCONF=/usr/local/share/gtags/gtags.conf

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=180'

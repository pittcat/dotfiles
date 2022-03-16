


## 保证tmux 中nvim color 不变

### 使用其他terminal的时候

set -g default-terminal "screen-256color"
set -ga terminal-overrides ",xterm-256color*:Tc"


### 使用kitty 
set -g default-terminal "${TERM}"

### 使用wezterm

set -g default-terminal 'tmux-256color'

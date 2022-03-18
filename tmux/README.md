## 保证 tmux 中 nvim color 不变

### 使用其他 terminal 的时候

set -g default-terminal "screen-256color"
set -ga terminal-overrides ",xterm-256color\*:Tc"

### 使用 kitty

set -g default-terminal "${TERM}"

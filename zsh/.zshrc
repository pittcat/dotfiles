source ~/.autoenv/activate.sh

source $HOME/.antigen/antigen.zsh
# oh-my-zsh
antigen use oh-my-zsh

antigen bundle archlinux

if [[ "$OSTYPE" == "darwin"* ]]; then
  antigen bundle osx
  antigen bundle brew
fi
antigen bundles <<EOB
# systemd
git
autojump
extract
tmux
sudo
copypath
command-not-found
copyfile
# py
python
pip
# js
# rb
# ruby
# rbenv
# gem
EOB
# --------------------------------------------other -------------------------------------------- #
antigen bundles <<EOB
skywind3000/z.lua
zsh-users/zsh-autosuggestions
zsh-users/zsh-completions
zdharma/fast-syntax-highlighting
changyuheng/zsh-interactive-cd
hlissner/zsh-autopair
Tarrasch/zsh-bd
wfxr/forgit
MenkeTechnologies/zsh-cargo-completion
felixr/docker-zsh-completion
# js
# py
gangleri/pipenv
lukechilds/zsh-nvm
EOB


# Load the theme.
antigen theme halfo/lambda-mod-zsh-theme
# # Tell Antigen that you're done.
antigen apply

# alias
. $HOME/.zshaliases
# function
. $HOME/.zshfunction
# keybind
. $HOME/.zshkeybind

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export QSYS_ROOTDIR="/home/pittcat/.cache/yay/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/21.1/quartus/sopc_builder/bin"



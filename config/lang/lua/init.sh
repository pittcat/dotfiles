sudo pacman -S lua
yay -S luarocks

sudo luarocks install --server=http://luarocks.org/dev lua-lsp
sudo luarocks install luacheck

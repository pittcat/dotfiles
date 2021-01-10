# rust
# install rust
sudo pacman -S rustup

source ~/.zshenv
# rust china mirrors
mkdir -p $HOME/.cargo
cp $PWD/rust-config $HOME/.cargo/config

# vim setting
# complete  format check


# lsp
rustup update
rustup component add rls-preview rust-analysis rust-src rustfmt

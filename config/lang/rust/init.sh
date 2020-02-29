# rust
# install rust
curl https://sh.rustup.rs -sSf | sh
# rust china mirrors
mkdir -p $HOME/.cargo

source $HOME/.cargo/env
# vim setting
# complete  format check

rustup toolchain add nightly
cargo +nightly install racer
rustup component add rustfmt-preview

# lsp
rustup update
rustup component add rls-preview rust-analysis rust-src

# rust
# install rust
# curl -sf -L https://static.rust-lang.org/rustup.sh | sh
curl https://sh.rustup.rs -sSf | sh
# rust china mirrors
mkdir -p $HOME/.cargo
echo "[source.crates-io]
registry = 'https://github.com/rust-lang/crates.io-index'
replace-with = 'ustc'
[source.ustc]
registry = 'git://mirrors.ustc.edu.cn/crates.io-index'" > $HOME/.cargo/config

# vim setting
# complete  format check
cargo install rustfmt racer  
# lsp
rustup component add rls-preview rust-analysis rust-src 

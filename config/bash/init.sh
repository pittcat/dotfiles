# bash lsp
if hash yarn 2>/dev/null; then
  yarn global add bash-language-server
else
  npm i -g bash-language-server
fi

if hash yaourt 2>/dev/null; then
  # vim format
  yaourt -S shfmt
fi

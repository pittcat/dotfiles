#! /usr/bin/env bash

# bash lsp
if hash yarn 2>/dev/null; then
  yarn global add bash-language-server
else
  npm i -g bash-language-server
fi

if hash yay 2>/dev/null; then
  # vim format and check
  yay -S shfmt shellcheck
fi


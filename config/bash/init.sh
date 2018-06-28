if hash yarn 2>/dev/null; then
  yarn global add bash-language-server
else
  npm i -g bash-language-server
fi

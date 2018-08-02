# install and config java
#!/usr/bin/env sh

if hash trizen 2>/dev/null; then
  trizen -S uncrustify jdtls google-java-format-git java-repl
elseif
  echo "Please install trizen"
fi

ln -s $PWD/uncrustify.cfg /home/pittcat/.uncrustify.cfg

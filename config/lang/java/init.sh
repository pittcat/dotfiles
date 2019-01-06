# install and config java
#!/usr/bin/env sh

if hash yay 2>/dev/null; then
  yay -S uncrustify jdtls google-java-format-git java-repl
else
  echo "Please install yay"
fi

ln -s $PWD/uncrustify.cfg /home/pittcat/.uncrustify.cfg

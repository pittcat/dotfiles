if [ -d /etc/apt ];then
  PKMG="apt install"
elif [ -d /etc/pacman.d ];then
  PKMG="pacman -S"
fi
# web
#  vim setting
# autocomplete
sudo npm i -g tern
# ale
sudo $PKMG tidy #html

sudo npm install -g $(cat npmpack | egrep -v "^\s*(#|$)")

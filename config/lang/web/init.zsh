PKMG="pacman -S"
# web
#  vim setting
# autocomplete
sudo npm i -g tern
# ale
sudo $PKMG tidy #html

sudo npm install -g $(cat npmpack | egrep -v "^\s*(#|$)")

ln -s $PWD/tern-project ~/.tern-project

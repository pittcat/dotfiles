yay -S npm yarn
# npm and yarn setting
npm config set registry https://registry.npm.taobao.org --global
npm config set disturl https://npm.taobao.org/dist --global
yarn config set registry https://registry.npm.taobao.org --global
yarn config set disturl https://npm.taobao.org/dist --global

yarn config set prefix $(npm prefix -g)
# web
#  vim setting
# autocomplete
npm i -g 
# ale
sudo $PKMG tidy #html

npm install -g $(cat npmpack | egrep -v "^\s*(#|$)")

npm install -g $(cat npmdaily | egrep -v "^\s*(#|$)")

ln -s $PWD/tern-project ~/.tern-project

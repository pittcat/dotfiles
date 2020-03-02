# web
#  vim setting
sudo pacman -S tidy npm #html
# mkdir -p ~/.yarn/bin
# sudo chmod 777 ~/.yarn/bin
yarn config set prefix ~/.yarn
yarn global add $(cat yarnpack | egrep -v "^\s*(#|$)")

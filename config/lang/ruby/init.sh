# https://ruby-china.org/wiki/rbenv-guide
# https://github.com/rbenv/ruby-build/wiki
# rbenv and ruby

#install ruby

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
# 用来编译安装 ruby
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
# 用来管理 gemset, 可选, 因为有 bundler 也没什么必要
git clone git://github.com/jamis/rbenv-gemset.git  ~/.rbenv/plugins/rbenv-gemset
# 通过 rbenv update 命令来更新 rbenv 以及所有插件, 推荐
git clone git://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update
# 使用 Ruby China 的镜像安装 Ruby, 国内用户推荐
git clone git://github.com/AndorChen/rbenv-china-mirror.git ~/.rbenv/plugins/rbenv-china-mirror
# change mirrors to tuna
sudo gem update --system
sudo gem sources --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/ --remove https://rubygems.org/
gem sources --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/ --remove https://rubygems.org/

# source ~/.zshrc >> /dev/null && zsh

# manual

# vim setting
# autocomplete
# gem install solargraph
# pip install solargraph-utils.py --user
# yard gems 
# yard config --gem-install-yri
# gem install rubocop   # ale and neoformat
# gem install ripper-tags # tagbar

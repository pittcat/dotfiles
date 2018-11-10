#!/usr/bin/env bash

sudo pacman -Ss php composer
composer config -g repo.packagist composer https://packagist.phpcomposer.com
# format
composer global require "squizlabs/php_codesniffer=*"
# lsp
composer global require jetbrains/phpstorm-stubs:dev-master
composer global require felixfbecker/language-server

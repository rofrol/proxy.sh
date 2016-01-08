#!/bin/bash

proxy="${1}"
exception="${2}"
gitconfig_proxy="~/.gitconfig_proxy"
gitconfig_proxy_r="${gitconfig_proxy/#\~/$HOME}"

#################################################################################
# git
#################################################################################

git config -f ${gitconfig_proxy_r} http.proxy ${proxy}
git config -f ${gitconfig_proxy_r} https.proxy ${proxy}
git config -f ${gitconfig_proxy_r} http."${exception}".proxy ''
git config -f ${gitconfig_proxy_r} https."${exception}".proxy ''
git config --global include.path "${gitconfig_proxy}"
# check with: git config --global -l

#################################################################################
# npm
#################################################################################

npm config set http-proxy ${proxy}
npm config set https-proxy ${proxy}
# check with: npm config ls

#################################################################################
# atom.io
#################################################################################

apm config set http-proxy ${proxy}
apm config set https-proxy ${proxy}
# check with: apm config ls

#################################################################################
# gem
#################################################################################

echo "http_proxy: ${proxy}" > ~/.gemrc
# check with: gem environment

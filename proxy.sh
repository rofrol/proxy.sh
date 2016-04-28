#!/bin/bash

# Provide settings as parameters
[ ! -z "$1" ] && HTTP_PROXY=${1}
[ ! -z "$2" ] && HTTP_PROXY_EXCEPTION=${2}

if [ -z "$HTTP_PROXY" ]; then
echo "set HTTP_PROXY or run: sh proxy.sh <proxy>"
exit 1
fi

echo HTTP_PROXY=${HTTP_PROXY}
echo HTTP_PROXY_EXCEPTION=${HTTP_PROXY_EXCEPTION}

GITCONFIG_PROXY="~/.gitconfig_proxy"

# git config -f needs $HOME and not ~
GITCONFIG_PROXY_EXPANDED="${GITCONFIG_PROXY/#\~/$HOME}"

#################################################################################
# git
#################################################################################

git config -f ${GITCONFIG_PROXY_EXPANDED} http.proxy ${HTTP_PROXY}
git config -f ${GITCONFIG_PROXY_EXPANDED} https.proxy "${HTTP_PROXY}"

if [ ! -z "$HTTP_PROXY_EXCEPTION" ]; then
git config -f ${GITCONFIG_PROXY_EXPANDED} http."${HTTP_PROXY_EXCEPTION}".proxy ''
git config -f ${GITCONFIG_PROXY_EXPANDED} https."${HTTP_PROXY_EXCEPTION}".proxy ''
fi

git config -f ${GITCONFIG_PROXY_EXPANDED} url."https://".insteadOf git://
git config --global include.path "${GITCONFIG_PROXY}"
# check with: git config --global -l

#################################################################################
# npm
#################################################################################

npm config set http-proxy ${HTTP_PROXY}
npm config set https-proxy ${HTTP_PROXY}
# check with: npm config ls

#################################################################################
# atom.io
#################################################################################

apm config set http-proxy ${HTTP_PROXY}
apm config set https-proxy ${HTTP_PROXY}
# check with: apm config ls

#################################################################################
# gem
#################################################################################

echo "http_proxy: ${HTTP_PROXY}" > ~/.gemrc
# check with: gem environment

#!/bin/bash

proxy="${1}"
exception="${2}"

#################################################################################
# git
#################################################################################

git config --global http.proxy ${proxy}
git config --global https.proxy ${proxy}
git config --global http."${exception}".proxy ''
git config --global https."${exception}".proxy ''
# check with: git config --global -l

#################################################################################
# bower
#################################################################################

# bower is using git, though you can use ~/.bowerrc

# not needed anymore https://github.com/bower/bower/pull/732
git config --global url."https://".insteadOf git://


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

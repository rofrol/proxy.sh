#!/bin/bash

proxy="${1}"
exception="${2}"

#################################################################################
# git
#################################################################################

cat <<EOT > ~/.gitconfig_proxy
# bower is using git, though you can use ~/.bowerrc
# not needed anymore? https://github.com/bower/bower/pull/732
[url "https://"]
	insteadOf = git://
[http]
	proxy = ${1}
[https]
	proxy = ${1}
[http "${2}"]
	proxy = 
[https "${2}"]
	proxy = 
EOT

git config --global include.path "~/.gitconfig_proxy"

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

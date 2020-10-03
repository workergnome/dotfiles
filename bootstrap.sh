#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	if [ -n "$ZSH_VERSION" ]; then
  	   source ~/.zshrc;
	elif [ -n "$BASH_VERSION" ]; then
	   source ~/.bash_profile;
	else
	   echo 'unknown shell'
	fi

}

doIt;

unset doIt;
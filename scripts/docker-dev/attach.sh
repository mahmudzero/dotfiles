#!/usr/bin/env zsh

AARCH=$1
TAG=""

if [[ $AARCH = "arm" ]]; then
	TAG="latest-arm"
elif [[ $AARCH = "x86" ]]; then
	TAG="latest-x86"
fi

docker exec -it dotfiles-$TAG bash

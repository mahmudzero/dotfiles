#!/usr/bin/env zsh

SCRIPT_DIR="$(dirname "$0")"

AARCH=$1
TAG=""

if [[ $AARCH = "arm" ]]; then
	TAG="latest-arm"
elif [[ $AARCH = "x86" ]]; then
	TAG="latest-x86"
fi


CID=$(cat $SCRIPT_DIR/container_id.$TAG.txt)
docker kill $CID
docker rm $CID
docker image rm dotfiles:$TAG

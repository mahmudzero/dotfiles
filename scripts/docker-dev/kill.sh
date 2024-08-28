#!/usr/bin/env zsh

SCRIPT_DIR="$(dirname "$0")"

CID=$(cat $SCRIPT_DIR/container_id.txt)
docker kill $CID
docker rm $CID
docker image rm dotfiles:latest

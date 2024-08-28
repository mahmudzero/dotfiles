#!/usr/bin/env zsh

SCRIPT_DIR="$(dirname "$0")"

CID=$(docker run --name dotfiles --detach dotfiles:latest)
echo $CID > $SCRIPT_DIR/container_id.txt

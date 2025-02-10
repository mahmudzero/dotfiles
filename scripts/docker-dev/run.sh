#!/usr/bin/env zsh

SCRIPT_DIR="$(dirname "$0")"

AARCH="${1:-arm}"
TAG=""
BUILDPLATFORM=""

if [[ $AARCH = "arm" ]]; then
	TAG="latest-arm"
	BUILDPLATFORM="linux/arm64"
elif [[ $AARCH = "x86" ]]; then
	TAG="latest-x86"
	BUILDPLATFORM="linux/amd64"
fi


CID=$(docker run --name dotfiles-$TAG --network host --detach dotfiles:$TAG)
echo $CID > $SCRIPT_DIR/container_id.$TAG.txt

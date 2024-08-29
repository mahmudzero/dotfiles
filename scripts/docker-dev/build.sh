#!/usr/bin/env zsh

SCRIPT_DIR="$(dirname "$0")"
ROOT_DIR="$SCRIPT_DIR/../.."
DOCKER_DIR="$ROOT_DIR/docker"
DOCKERFILE=$DOCKER_DIR/Dockerfile

AARCH=$1
TAG=""
BUILDPLATFORM=""

if [[ $AARCH = "arm" ]]; then
	TAG="latest-arm"
	BUILDPLATFORM="linux/arm64"
elif [[ $AARCH = "x86" ]]; then
	TAG="latest-x86"
	BUILDPLATFORM="linux/amd64"
fi


docker build . --tag dotfiles:$TAG --file $DOCKERFILE --platform $BUILDPLATFORM

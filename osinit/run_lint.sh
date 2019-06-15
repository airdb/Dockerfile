#!/bin/sh
# Copyright @ airdb.com

BUILD_DIR="/srv"

function golint() {
  go mod download
  golangci-lint run
}

function jslint() {
    npm install
}

function usage() {
	echo -e "Usage: $0 Git_URL"
	echo
	echo -e "Example:"
	echo -e "\t$0 https://github.com/bbhj/minabbs"
}

function main() {
  if [ -z "$1" ]; then
	  usage
	  exit 0
  fi

  set -xe
  GIT_URL="$1"
  PROJECT=$(echo $GIT_URL | awk -F'/' '{print $NF}')
  git clone $GIT_URL $BUILD_DIR/$PROJECT/
  cd $BUILD_DIR/$PROJECT/

  golint
}

# here we go
main "$@"

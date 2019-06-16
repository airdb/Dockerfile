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
	COMMAND="run_lint.sh"
	echo -e "Usage: $COMMAND lang url"
	echo
	echo -e "lang support:"
	echo -e "\tgo\t- golang language"
	echo -e "\tnodejs\t- nodejs language"
	echo -e "\tpython\t- python language"
	echo
	echo -e "Example:"
	echo -e "\t$COMMAND go https://github.com/bbhj/minabbs"
}

function main() {
  if [ "$#" -ne 2 ]; then
	  usage
	  exit 0
  fi

  set -xe
  LANG_TYPE="$1"
  GIT_URL="$2"
  PROJECT=$(echo $GIT_URL | awk -F'/' '{print $NF}')
  git clone $GIT_URL $BUILD_DIR/$PROJECT/
  cd $BUILD_DIR/$PROJECT/

  case "$LANG_TYPE" in
    go)
      golint
    ;;
    python)
      pylint
    ;;
    *)
      usage
    ;;
  esac
}

# here we go
main "$@"

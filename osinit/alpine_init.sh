#!/bin/sh
# Copyright @ airdb.com

apk add --no-cache musl-dev go
go get -u github.com/golangci/golangci-lint/cmd/golangci-lint


apk add --no-cache python py-pip
pip install pylint

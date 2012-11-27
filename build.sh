#!/bin/bash

# Setup the environment
export GOPATH=$GOPATH:$PWD

BIN_DIR=$PWD/bin
ROOT_DIR=$PWD

echo " --> Building MongoQueue"
cd $ROOT_DIR/src/ 
FILES=`ls *.go`
# go build -o $BIN_DIR/autonutus $FILES
go test src/mongoqueue_test.go

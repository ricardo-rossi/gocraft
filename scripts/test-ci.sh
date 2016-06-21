#! /bin/bash

docker build -t "meetup-server" .
docker run meetup-server go test -v github.com/ricardo-rossi/meetup

if ! [ $? -eq 0 ]; then exit 1; fi
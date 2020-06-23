#!/usr/bin/env bash
#
# build docker image
#

name="log-pilot"
version="0.9.7"

build()
{
    echo -e "building image: $name:$tag\n"

    docker build -t $name:$tag -f Dockerfile.$1 .
}

case $1 in
fluentd)
    tag="${version}-$1"
    build fluentd
    ;;
*)
    tag="${version}-filebeat"
    build filebeat
    ;;
esac

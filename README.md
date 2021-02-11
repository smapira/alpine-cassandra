# docker-alpine-cassandra

This repository contains Dockerfile for [cassandra 3.11](http://cassandra.apache.org/)
container, based on the [Alpine edge](https://hub.docker.com/_/alpine/) image.

## Install

As a prerequisite, you need [Docker](https://docker.com) to be installed.

To download this image from the public docker hub:

	$ docker pull smapira/docker-alpine-cassandra

To re-build this image from the dockerfile:

	$ docker build -t docker-alpine-cassandra .

## Usage

To run `cassandrad`:

	$ docker run -d -p 9042:9042 --name alpine-cassandra docker-alpine-cassandra

To use the cassandra cqlsh client:

	$ docker exec -ti alpine-cassandra cqlsh

To login:

	$ docker exec -ti alpine-cassandra /bin/ash

## Super Thanks
- [mvertes/docker-alpine-mongo](https://github.com/mvertes/docker-alpine-mongo)

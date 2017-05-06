# docker-alpine-cassandra

This repository contains Dockerfile for [cassandraDB 3.4](https://www.cassandradb.org)
container, based on the [Alpine edge](https://hub.docker.com/_/alpine/) image.

## Install

As a prerequisite, you need [Docker](https://docker.com) to be installed.

To download this image from the public docker hub:

	$ docker pull mvertes/alpine-cassandra

To re-build this image from the dockerfile:

	$ docker build -t mvertes/alpine-cassandra .

## Usage

To run `cassandrad`:

	$ docker run -d --name cassandra -p 27017:27017 mvertes/alpine-cassandra

You can also specify the database repository where to store the data
with the volume -v option:

    $ docker run -d --name cassandra -p 27017:27017 \
	  -v /somewhere/onmyhost/mydatabase:/data/db \
	  mvertes/alpine-cassandra

To run a shell session:

    $ docker exec -ti cassandra sh

To use the cassandra shell client:

	$ docker exec -ti cassandra cassandra

The cassandra shell client can also be run its own container: 

	$ docker run -ti --rm --name cassandrashell monogo host:port/db

## Limitations

- On MacOSX, volumes located in a virtualbox shared folder are not
  supported, due to a limitation of virtualbox (default docker-machine
  driver) not supporting fsync().

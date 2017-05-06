FROM alpine:edge

MAINTAINER <info@routeflags.com>

# Update Alpine environment
RUN apk update
RUN apk upgrade
RUN apk add ca-certificates

## Install Cassandra
RUN wget http://apache.cs.utah.edu/cassandra/3.10/apache-cassandra-3.10-bin.tar.gz
RUN tar -xvzf apache-cassandra-3.10-bin.tar.gz
RUN mv apache-cassandra-3.10 /root/cassandra
RUN mkdir /var/lib/cassandra
RUN mkdir /var/log/cassandra

## Establish Cassandra Environmental Variables
ENV CASSANDRA_VERSION 3.10
ENV CASSANDRA_HOME /root/cassandra
ENV PATH $PATH:/root/cassandra/bin

EXPOSE 9042

# Clean APK cache
RUN rm -rf /var/cache/apk/*

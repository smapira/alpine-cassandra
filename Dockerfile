FROM alpine:edge

MAINTAINER <smapira@routeflags.com>

# Update Alpine environment
RUN apk add --update --no-cache ca-certificates openjdk8 python

## Establish Cassandra Environmental Variables
ENV CASSANDRA_VERSION 3.10
ENV CASSANDRA_HOME /root/cassandra

## Install Cassandra
RUN wget --output-document - http://ftp.riken.jp/net/apache/cassandra/$CASSANDRA_VERSION/apache-cassandra-$CASSANDRA_VERSION-bin.tar.gz | tar zxvf - && \
  mv apache-cassandra-$CASSANDRA_VERSION $CASSANDRA_HOME
RUN mkdir /var/lib/cassandra /var/log/cassandra
ENV PATH $PATH:$CASSANDRA_HOME/bin

## 7000: intra-node communication
## 7001: TLS intra-node communication
## 7199: JMX
## 9042: CQL
## 9160: thrift service
EXPOSE 9042

CMD [ "cassandra", "-Rf" ]

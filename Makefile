VERSION = 1.0.0
IMAGE = docker-alpine-cassandra:$(VERSION)

all: image run

image:
	docker build -t $(IMAGE) --no-cache .	
run:
	docker run -d -p 9042:9042 --name alpine-cassandra $(IMAGE) 

TAG:=$(shell git rev-parse --short HEAD)

push-stage: build
	docker tag cairo/tiler:${TAG} 810375751604.dkr.ecr.us-east-1.amazonaws.com/tiler:${TAG}
	docker push 810375751604.dkr.ecr.us-east-1.amazonaws.com/tiler

build:
	docker build -t cairo/tiler:${TAG} .

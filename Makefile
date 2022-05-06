TAG := 4.6.2
IMG :=

build:	## build the current tag and latest version
	DOCKER_BUILDKIT=1 docker build --ssh default -t $(IMG):latest-nonroot . -f Dockerfile
	DOCKER_BUILDKIT=1 docker build --ssh default -t $(IMG):$(TAG)-nonroot . -f Dockerfile

push: build		## push the current tag and latest version [deps:build]
	docker push $(IMG):latest-nonroot
	docker push $(IMG):$(TAG)-nonroot

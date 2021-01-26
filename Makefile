SHELL:=/usr/bin/env bash
MAKEFILE_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

# Image URL to use all building/pushing image targets;
# Use your own docker registry and image name for dev/test by overridding the
# IMAGE_REPO, IMAGE_NAME and IMAGE_TAG environment variable.
IMAGE_REPO?=docker.io/podmu
IMAGE_NAME?=netnuke
IMAGE_TAG?=$(shell date +v%Y%m%d)-$(shell git describe --match=$(git rev-parse --short=8 HEAD) --tags --always --dirty)
PUBLIC_TAG?="$(IMAGE_REPO)/$(IMAGE_NAME):latest"

build:
	docker build --progress plain \
	-t $(IMAGE_REPO)/$(IMAGE_NAME):$(IMAGE_TAG) \
	-t $(IMAGE_NAME):$(IMAGE_TAG) \
	-t $(IMAGE_NAME):latest \
	-t $(PUBLIC_TAG) \
	-f ./Dockerfile .

push:
	docker image push $(PUBLIC_TAG)
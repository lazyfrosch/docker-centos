DOCKER_REPO := ${DOCKER_REPO}
ifeq ($(DOCKER_REPO),)
DOCKER_REPO := lazyfrosch/centos
endif

DOCKER_REGISTRY := ${DOCKER_REGISTRY}
ifneq ($(DOCKER_REGISTRY),)
DOCKER_REPO := $(DOCKER_REGISTRY)/$(DOCKER_REPO)
endif

ifeq ($(DOCKER_TAG),)
DOCKER_TAG := 7-systemd
endif

DOCKER_SECONDARY_TAG := systemd

FROM := $(shell grep FROM Dockerfile | cut -d" " -f2)
IMAGE := $(DOCKER_REPO):$(DOCKER_TAG)
ifneq ($(DOCKER_SECONDARY_TAG),)
IMAGE_SECONDARY := $(DOCKER_REPO):$(DOCKER_SECONDARY_TAG)
endif

all: pull build

pull:
	docker pull "$(IMAGE)" || true
	docker pull "$(FROM)"

build:
	docker build --cache-from "$(IMAGE)" --tag "$(IMAGE)" .
ifneq ($(DOCKER_SECONDARY_TAG),)
	docker tag "$(IMAGE)" "$(IMAGE_SECONDARY)"
endif

push:
	docker push "$(IMAGE)"
ifneq ($(DOCKER_SECONDARY_TAG),)
	docker push "$(IMAGE_SECONDARY)"
endif

clean:
	if (docker inspect --type image "$(IMAGE)" >/dev/null 2>&1); then docker rmi "$(IMAGE)"; fi

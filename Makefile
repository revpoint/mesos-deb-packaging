SHELL := /bin/bash
PWD := $(shell pwd)

MAKEFLAGS ?= -j8
MESOS_REPO_URL ?= https://gitbox.apache.org/repos/asf/mesos.git
MESOS_REPO_VERSION ?= 1.7.3
MESOS_CONFIGURE_FLAGS := CXXFLAGS=-Wno-error=parentheses --disable-python

.PHONY: build
build:
	./build_mesos --repo "$(MESOS_REPO_URL)?tag=$(MESOS_REPO_VERSION)" --configure-flags "$(MESOS_CONFIGURE_FLAGS)" --rename

.PHONY: docker
docker:
	docker build -t mesos-deb-packaging .
	docker run -it -v $(PWD):/mesos-deb-packaging mesos-deb-packaging

.PHONY: dist.tgz
dist.tgz:
	git ls-files | xargs tar czf dist.tgz

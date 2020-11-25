.PHONY: dist.tgz

dist.tgz:
	git ls-files | xargs tar czf dist.tgz

docker:
	docker build -t mesos-deb-packaging .
	docker run -t -v $(pwd):/mesos-deb-packaging mesos-deb-packaging

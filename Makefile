NAMESPACE:=balnbibarbi

.PHONY: all
all: build publish deploy

.PHONY: build
build:
	docker build -t balnbibarbi/helloworld-python .

.PHONY: publish
publish:
	docker push bingbangboo/helloworld-python

.PHONY: deploy
deploy:
	tanzu apps workload delete helloworld-python -n $(NAMESPACE) -y
	tanzu apps workload apply -f Workload.yaml -y

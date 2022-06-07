NAMESPACE:=balnbibarbi

.PHONY: source
source: deploy-source

.PHONY: image
image: build publish deploy-image

.PHONY: build
build:
	docker build -t balnbibarbi/helloworld-python .

.PHONY: publish
publish:
	docker push bingbangboo/helloworld-python

.PHONY: delete
delete:
	tanzu apps workload delete helloworld-python -n $(NAMESPACE) -y

.PHONY: deploy-image
deploy-image:
	tanzu apps workload delete helloworld-python -n $(NAMESPACE) -y
	tanzu apps workload apply -f Workload-image.yaml -y

.PHONY: deploy-source
deploy-source:
	tanzu apps workload delete helloworld-python -n $(NAMESPACE) -y
	tanzu apps workload apply -f Workload-source.yaml --build-env BP_CPYTHON_VERSION="3.10.*" -y

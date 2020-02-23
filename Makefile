IMAGE_NAME := cert-manager-webhook-alidns
IMAGE_TAG := latest

verify:
	go test -v .

build:
	docker build -t lurongkai/$(IMAGE_NAME):$(IMAGE_TAG) .

.PHONY: rendered-manifest.yaml
rendered-manifest.yaml:
	helm template \
        --set image.repository=$(IMAGE_NAME) \
        --set image.tag=$(IMAGE_TAG) \
		cert-manager-webhook-alidns \
        deploy/webhook-alidns > "./deploy/rendered-manifest.yaml"

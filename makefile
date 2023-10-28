create-cluster:
	@./create-cluster.sh

delete-cluster:
	@kind delete cluster -n certjaeger-test

update-repo:
	@helm repo add jetstack https://charts.jetstack.io
	@helm repo update

deploy-cert-manager:
	@helm install \
		cert-manager jetstack/cert-manager \
		--namespace cert-manager \
		--create-namespace \
		--version v1.13.1 \
		--set installCRDs=true

deploy-jaeger:
	@helm install \
		jaeger jaeger-operator \
		-f jaeger-operator/values.local.yaml

deploy-grafana:
	@helm install \
		grafana bitnami/grafana \
		-f grafana.yaml
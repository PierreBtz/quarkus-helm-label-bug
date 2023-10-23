# assuming your current context points to a kind cluster
.PHONY: deploy-kind
deploy-kind:
	mvn clean package -Dquarkus.kubernetes.deploy=true && \
	kind load docker-image local/reproducer/quarkus-helm-label-bug:1.0.0-SNAPSHOT && \
	helm upgrade --install reproducer ./target/helm/kubernetes/quarkus-helm-label-bug
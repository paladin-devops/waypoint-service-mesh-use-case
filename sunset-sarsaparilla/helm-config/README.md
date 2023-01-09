This part of the repo contains Terraform configuration for an installation of the
HashiCorp Consul Helm chart. 

In order to use this configuration, you must have a 
working Kubernetes context on your machine running Terraform. This should be 
configured for Terraform to use in `providers.tf`.

For more notes on the specific configurations of the Consul cluster to be deployed
to Kubernetes, see `values.yaml`, as well as the [Consul documentation](https://developer.hashicorp.com/consul/docs/k8s/helm)
for the Helm  chart options.
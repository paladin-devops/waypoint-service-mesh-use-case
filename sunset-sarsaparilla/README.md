This portion of the repo, sunset-sarsparilla, contains the configuration for 
a Consul datacenter named sunset-sarsparailla, running on Consul for Kubernetes.

- `helm-config`: Terraform configuration for an installation of the HashiCorp
Consul Helm chart.
- `kubernetes-azure-aks`: Terraform configuration for a AKS cluster in an Azure
East US resource group.
- `kubernetes-config`: YAML configuration of various Kubernetes resources
required for the `counter-ui` application deployment to the Consul Service
Mesh in the Kubernetes cluster.
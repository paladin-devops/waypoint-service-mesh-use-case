resource "helm_release" "consul" {
  name  = "consul"
  repository = "https://helm.releases.hashicorp.com"
  chart = "consul"
  namespace = "consul"
  version = "v1.0.2"

  values = [
    "${file("values.yaml")}"
  ]
}
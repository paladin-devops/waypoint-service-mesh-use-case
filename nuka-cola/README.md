This portion of the repo, nuka-cola, contains the configuration for
a Consul datacenter named nuka-cola, running on HashiCorp Consul, integrated 
with HashiCorp Nomad running on AWS EC2s.

- `counter-api.nomad.hcl`: The Nomad job file to be used by HashiCorp Waypoint
to deploy the counter-api application.
- `counter-api.nomad.hcl`: The Consul configuration to set the protocol of the
`counter-api` service to HTTP.
- `mesh.hcl`: The Consul configuration required for peering through mesh 
gateways.
- `mesh-gateway.nomad.hcl`: The Nomad job specification to deploy a mesh gateway
to a Consul-integrated Nomad cluster.
- `mesh-gateway-proxy-defaults.hcl`: The Consul configuration used to set the
default mesh gateway mode to local.
- `peering-config.hcl`: The Consul configuration required to export the counter-api
service to the sunset-sarsaparilla datacenter.
- `peering-intentions.hcl`: The Consul intention required to allow communication
from the counter-ui service in the sunset-sarsparilla datacenter to the exported
counter-api service.
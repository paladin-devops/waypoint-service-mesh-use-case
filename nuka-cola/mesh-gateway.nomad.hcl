job "mesh-gateway" {
  datacenters = ["nuka-cola"]
  group "mesh-gateway" {
    network {
      mode = "bridge"
    }
    service {
      connect {
        gateway {
          mesh {}
          proxy {}
        }
      }
    }
  }
}
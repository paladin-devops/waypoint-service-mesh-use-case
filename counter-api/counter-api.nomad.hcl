job "counter-api" {
  datacenters = ["nuka-cola"]
  group "api" {
    count = ${count}
    network {
      mode = "bridge"
    }

    service {
      name = "count-api"
      port = "9001"

      connect {
        sidecar_service {}
      }
    }

    task "web" {
      driver = "docker"
      config {
        image = "${artifact.image}:${artifact.tag}"
      }
    }
  }
}

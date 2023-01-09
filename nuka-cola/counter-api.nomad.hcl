job "counter-api" {
  datacenters = ["nuka-cola"]
  group "api" {
    count = ${count}
    network {
      mode = "bridge"
    }

    service {
      name = "counter-api"
      port = "9002"
      check {
        expose   = true
        type     = "http"
        name     = "api-health"
        path     = "/health"
        interval = "10s"
        timeout  = "3s"
      }

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

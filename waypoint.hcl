project = "countdash"

variable "runner_profile" {
  description = "The name of the runner profile to use for the operation."
  type = string
}

variable "api_replicas" {
  type = number
  default = 1
}

variable "ui_replicas" {
  type = number
  default = 1
}

runner {
  enabled = true
  profile = "nomad-mr-house"
}

app "counter-api" {
  build {
    use "docker" {
      dockerfile = "${path.app}/counter-api/Dockerfile"
    }
  }

  deploy {
    use "nomad-jobspec" {
      jobspec = templatefile("${path.app}/counter-api/counter-api.nomad.hcl", {
        count = var.api_replicas
      })
    }
  }
}

app "counter-ui" {
  build {
    use "docker-ref" {
      image = "hashicorpnomad/counter-dashboard"
      tag   = "v1"
    }
  }

  deploy {
    use "kubernetes" {
      // TODO: Add k8s deployment configs
    }
  }
}
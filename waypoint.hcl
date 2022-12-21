project = "countdash"

variable "username" {
  description = "Username of user with permission to push to the registry."
  type        = string
  sensitive   = true
}

variable "password" {
  description = "Password of user with permission to push to the registry."
  type        = string
  sensitive   = true
}

variable "api_image_name" {
  description = "The name of the API Docker image to push to the registry."
  type        = string
}

variable "api_tag_name" {
  description = "The tag of the API Docker image to push to the registry."
  type        = string
}

variable "ui_image_name" {
  description = "The name of the UI Docker image to push to the registry."
  type        = string
}

variable "ui_tag_name" {
  description = "The tag of the UI Docker image to push to the registry."
  type        = string
}

variable "api_replicas" {
  description = "The # of API replicas to deploy."
  type        = number
  default     = 1
}

variable "ui_replicas" {
  description = "The # of UI replicas to deploy."
  type        = number
  default     = 1
}

runner {
  enabled = true
  profile = "kubernetes-mr-new-vegas"
}

app "counter-api" {
  build {
    use "docker" {
      dockerfile = "${path.app}/counter-api/Dockerfile"
      context    = "${path.app}/counter-api/"
    }

    registry {
      use "docker" {
        image = var.api_image_name
        tag   = var.api_tag_name

        auth {
          username = var.username
          password = var.password
        }
      }
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
    use "docker-pull" {
      image = "hashicorpnomad/counter-dashboard"
      tag   = "v1"
    }

    registry {
      use "docker" {
        image = var.ui_image_name
        tag   = var.ui_tag_name

        auth {
          username = var.username
          password = var.password
        }
      }
    }
  }

  deploy {
    use "kubernetes-apply" {
      path = templatedir("${path.app}/counter-ui")
    }
  }
}
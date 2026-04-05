terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Pull nginx image once
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# Dynamically create one container per entry in var.container_config
resource "docker_container" "nginx" {
  for_each = { for c in var.container_config : c.name => c }

  name  = each.value.name
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = each.value.port
  }
}

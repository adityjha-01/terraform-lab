variable "container_name" {
  description = "Name of the Docker container"
  type        = string
}

variable "container_port" {
  description = "Host port to map to container port 80"
  type        = number
}

variable "image_name" {
  description = "Docker image to use"
  type        = string
  default     = "nginx:latest"
}

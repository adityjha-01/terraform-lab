output "service_url" {
  description = "URL to reach this container"
  value       = "http://localhost:${var.container_port}"
}

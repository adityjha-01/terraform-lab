output "container_urls" {
  description = "URLs of all dynamically created containers"
  value       = [for c in var.container_config : "http://localhost:${c.port}"]
}

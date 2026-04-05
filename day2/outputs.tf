output "file_path" {
  description = "Path of the created environment file"
  value       = local_file.env_file.filename
}

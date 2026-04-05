output "file_path" {
  description = "Absolute path of the created file"
  value       = local_file.hello.filename
}

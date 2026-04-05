# Day 3 – Managing Containers with Terraform

## Objective
Use Terraform's Docker provider to pull an image and run a container locally.

## Files
| File | Purpose |
|------|---------|
| `main.tf` | Docker provider, nginx image, and container resource |
| `outputs.tf` | Prints the service URL after apply |

## Prerequisites
- Docker Desktop (or Docker Engine) must be running before executing Terraform.

## Steps Performed

1. Configured the `kreuzwerker/docker` provider.

2. Declared a `docker_image` resource to pull `nginx:latest`.

3. Declared a `docker_container` resource mapping container port 80 → host port 8080.

4. Ran the workflow:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

5. Verified the container is running:
   ```bash
   docker ps
   ```

6. Opened **http://localhost:8080** in a browser — nginx welcome page appeared.

## Example Output
```
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:
service_url = "http://localhost:8080"
```

## Teardown
```bash
terraform destroy
```

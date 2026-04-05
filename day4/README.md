# Day 4 – Terraform Modules

## Objective
Structure Terraform configuration using reusable modules.

## Directory Structure
```
day4/
├── main.tf                          # Root config – calls the module twice
├── outputs.tf                       # Prints both service URLs
└── modules/
    └── nginx_container/
        ├── main.tf                  # Docker image + container resources
        ├── variables.tf             # container_name, container_port, image_name
        └── outputs.tf              # service_url output
```

## Module Interface
| Variable | Type | Description |
|----------|------|-------------|
| `container_name` | string | Name assigned to the container |
| `container_port` | number | Host port mapped to container port 80 |
| `image_name` | string | Docker image (default: `nginx:latest`) |

## Steps Performed

1. Extracted the container logic from Day 3 into `modules/nginx_container/`.

2. Root `main.tf` calls the module twice with different ports (8081, 8082).

3. Ran the workflow:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

4. Verified both containers at:
   - http://localhost:8081
   - http://localhost:8082

## Example Output
```
Outputs:
nginx_8081_url = "http://localhost:8081"
nginx_8082_url = "http://localhost:8082"
```

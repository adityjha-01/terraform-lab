# Day 5 – Automation, Validation & Dynamic Infrastructure (Bonus)

## Objective
Automate Terraform validation via CI and dynamically generate multiple containers using `for_each`.

---

## Part A – CI Validation Workflow

The workflow file lives at `.github/workflows/terraform-check.yml` (in the repo root).

It runs automatically on every push and executes:
```
terraform fmt -check
terraform validate
terraform plan
```

---

## Part B – Dynamic Infrastructure (Bonus Challenge)

### Files
| File | Purpose |
|------|---------|
| `main.tf` | Docker provider + dynamic `docker_container` using `for_each` |
| `variables.tf` | `container_config` list-of-objects variable |
| `outputs.tf` | Prints all container URLs |

### How `for_each` Works Here
```hcl
for_each = { for c in var.container_config : c.name => c }
```
This converts the list into a map keyed by container name, allowing Terraform to track each container independently.

### Steps Performed

1. Defined `container_config` as a list of `{ name, port }` objects.
2. Used `for_each` to create one `docker_container` per entry.
3. Ran the workflow:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```
4. Verified all three containers:
   - http://localhost:8081
   - http://localhost:8082
   - http://localhost:8083

### Example Output
```
Outputs:
container_urls = [
  "http://localhost:8081",
  "http://localhost:8082",
  "http://localhost:8083",
]
```

### Adding More Containers
Simply append to `container_config` in `variables.tf` (or a `.tfvars` file) and re-run `terraform apply` — no other code changes needed.

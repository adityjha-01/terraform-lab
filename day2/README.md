# Day 2 – Variables and Multiple Configurations

## Objective
Parameterise Terraform configuration using input variables and `.tfvars` files.

## Files
| File | Purpose |
|------|---------|
| `main.tf` | Creates a local file using variable inputs |
| `variables.tf` | Declares `filename` and `message` variables |
| `outputs.tf` | Outputs the created file path |
| `dev.tfvars` | Variable values for development environment |
| `prod.tfvars` | Variable values for production environment |

## Steps Performed

1. Extended Day 1 config – both `filename` and `message` are now variables (no defaults, must be supplied).

2. Created two `.tfvars` files with environment-specific values.

3. Applied with different variable files:
   ```bash
   terraform init

   # Dev environment
   terraform apply -var-file="dev.tfvars"

   # Prod environment
   terraform apply -var-file="prod.tfvars"
   ```

4. Verified that `dev.txt` / `prod.txt` were created with the correct content.

## Key Concept
`.tfvars` files let you keep the same Terraform configuration and simply swap values per environment — no code duplication required.

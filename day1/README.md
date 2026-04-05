# Day 1 – Introduction to Terraform

## Objective
Understand the Terraform workflow and create a simple local file resource.

## Files
| File | Purpose |
|------|---------|
| `main.tf` | Declares the `local` provider and `local_file` resource |
| `variables.tf` | Defines the `message` input variable |
| `outputs.tf` | Outputs the file path after apply |

## Steps Performed

1. **Install Terraform** – downloaded from https://developer.hashicorp.com/terraform/downloads

2. **Write configuration** – `main.tf` uses the `local` provider to create `hello.txt` with the value of `var.message`.

3. **Run the workflow**
   ```bash
   terraform init      # downloads the local provider
   terraform plan      # shows what will be created
   terraform apply     # creates hello.txt
   ```

4. **Verify** – `hello.txt` appears in the directory containing "Hello from Terraform".

5. **Variable & output** – `variables.tf` exposes `message` with a default value; `outputs.tf` prints the file path.

## Example Output
```
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:
file_path = "/path/to/day1/hello.txt"
```

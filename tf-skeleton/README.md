# Terraform rewrite: start here

Fill the files in this order. Each file explains what to fill at the top.

| Step | File | What it holds |
|---|---|---|
| 1 | `versions.tf` | Terraform version and provider versions |
| 2 | `backend.tf` | Where state is stored (must match the old code) |
| 3 | `providers.tf` | Provider settings, then run `terraform init` |
| 4 | `variables.tf` + `terraform.tfvars` | Inputs and their values |
| 5 | `locals.tf` | Reusable computed values |
| 6 | `data.tf` | Lookups of things that already exist |
| 7 | `main.tf` | Resources, one at a time |
| 8 | `outputs.tf` | Values to print or share |
| 9 | `moved.tf` | Only if you renamed a resource |

Every word in CAPITALS (like `PROVIDER_NAME`) is a placeholder: replace it.
Every `""` is an empty value: fill it in.

After each step:

```bash
terraform fmt        # tidies formatting
terraform validate   # checks syntax and references
terraform plan       # goal: "No changes."
```

If `plan` shows `destroy` or `must be replaced`, stop and check what changed.

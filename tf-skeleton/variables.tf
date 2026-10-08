# =============================================================================
# STEP 4 — variables.tf
# Declares the inputs your code accepts. Values go in terraform.tfvars.
#
# Fill in, per variable:
#   VARIABLE_NAME → the variable name (replace the word itself)
#   description   → one line saying what it is for
#   type          → string | number | bool | list(string) | map(string) | object({...})
#   default       → uncomment only if the variable should be optional
#   sensitive     → uncomment and set to true for secrets
#
# Copy the block below once for each variable.
# =============================================================================

variable "VARIABLE_NAME" {
  description = ""
  type        = string
  # default   = ""
  # sensitive = true
}

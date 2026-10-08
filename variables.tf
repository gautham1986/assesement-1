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

variable "region" {
  description = "AWS region to create resources in"
  type        = string
}

variable "project" {
  description = "Short project name, used in names and tags"
  type        = string
}

variable "environment" {
  description = "Environment name, e.g. dev or prod"
  type        = string
}

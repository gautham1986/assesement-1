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
variable "vpc_cidr" {
  description = "CIDR block for the whole VPC"
  type        = string
}

variable "frontend_subnet_cidrs" {
  description = "Public subnets for the ALB and NAT gateway, one per AZ"
  type        = list(string)
}

variable "backend_subnet_cidrs" {
  description = "Private subnets for the nginx instances, one per AZ"
  type        = list(string)
}

variable "database_subnet_cidrs" {
  description = "Isolated subnets reserved for a future database, one per AZ"
  type        = list(string)
}
variable "instance_type" {
  description = "EC2 instance type for the nginx servers"
  type        = string
}

variable "bootstrap_with_user_data" {
  description = "true = user data installs nginx and syncs the site; false = leave it to Ansible"
  type        = bool
  default     = true
}
variable "acm_certificate_arn" {
  description = "ARN of a real ACM certificate. Leave empty to use a self-signed one."
  type        = string
  default     = ""
}
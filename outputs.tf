# =============================================================================
# STEP 8 — outputs.tf
# Values printed after apply, or read by other Terraform projects
# (IDs, IP addresses, URLs).
#
# Fill in:
#   OUTPUT_NAME → the output name (replace the word itself)
#   description → one line saying what it is
#   value       → a reference, e.g. RESOURCE_TYPE.RESOURCE_NAME.attribute
#   sensitive   → uncomment and set to true if it exposes a secret
#
# Copy the block once per output. Delete it if you don't need any.
# =============================================================================

output "account_id" {
  description = "The AWS account Terraform is using"
  value       = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  description = "The identity Terraform is logged in as"
  value       = data.aws_caller_identity.current.arn
}
output "site_bucket" {
  description = "S3 bucket holding the website"
  value       = aws_s3_bucket.site.bucket
}
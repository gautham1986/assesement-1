# =============================================================================
# STEP 1 — versions.tf
# Pins the Terraform version and the providers this project uses.
#
# Fill in:
#   required_version  → format: ">= 1.5.0"
#   PROVIDER_NAME     → the short provider name (replace the word itself)
#   source            → format: "namespace/name"
#   version           → format: "~> 5.0"
#
# Copy these from your OLD code. Add one block per provider you use.
# =============================================================================

terraform {
  required_version = ">= 1.16.5"

  required_providers {
    PROVIDER_NAME = aws{
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
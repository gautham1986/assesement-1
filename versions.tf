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
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}
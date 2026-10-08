# =============================================================================
# STEP 3 — providers.tf
# Configures each provider (account, region, project, credentials source...).
#
# Fill in:
#   PROVIDER_NAME → same name you used in versions.tf
#   settings      → copy from your old provider block
#
# Never put passwords or keys here. Use variables or environment variables.
#
# After this step run:  terraform init
# =============================================================================

provider "aws" {
  region = "eu-north-1"
}

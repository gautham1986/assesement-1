# =============================================================================
# STEP 5 — locals.tf
# Values you compute once and reuse: naming prefixes, common tags/labels,
# combined strings. Use them elsewhere as local.<name>.
#
# Fill in: one line per local → name = expression
# Leave empty if you don't need any.
# =============================================================================
locals {
  name_prefix = "${var.project}-${var.environment}"

  # First 3 AZs in your region, e.g. eu-north-1a, 1b, 1c
  azs = slice(data.aws_availability_zones.available.names, 0, 3)

  common_tags = {
    Project     = var.project
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}
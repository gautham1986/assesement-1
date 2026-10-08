# =============================================================================
# STEP 7 — main.tf
# The resources Terraform creates and manages. This is the core of the rewrite.
#
# Fill in:
#   RESOURCE_TYPE → the resource type (replace the word itself)
#   RESOURCE_NAME → your label for it
#   arguments     → its settings (use var.*, local.*, data.* instead of
#                   hard-coded values where it makes sense)
#
# Rules for a safe rewrite:
#   1. Move ONE resource at a time, then run:
#        terraform fmt
#        terraform validate
#        terraform plan
#   2. Keep RESOURCE_TYPE and RESOURCE_NAME the same as the old code.
#      If you rename one, add a moved block in moved.tf, or Terraform will
#      destroy the old one and create a new one.
#   3. "No changes" in plan = success. "destroy" or "must be replaced" = stop.
#
# Copy the block once per resource. When this file gets long, split it
# by area (network.tf, compute.tf, storage.tf...). Terraform reads every
# .tf file in the folder, so file names are up to you.
# =============================================================================

resource "RESOURCE_TYPE" "RESOURCE_NAME" {
  # arguments go here
}

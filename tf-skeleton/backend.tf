# =============================================================================
# STEP 2 — backend.tf
# Tells Terraform where its state file lives.
#
# IMPORTANT: this must match your OLD backend exactly. If it doesn't,
# Terraform can't see what already exists and will plan to create everything.
#
# Fill in:
#   BACKEND_TYPE → the backend name from your old code (replace the word itself)
#   settings     → copy each line from your old backend block
#
# If your old code had NO backend block, delete this whole file.
# =============================================================================

terraform {
  backend "BACKEND_TYPE" {
    # settings go here
  }
}

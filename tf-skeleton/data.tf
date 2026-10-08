# =============================================================================
# STEP 6 — data.tf
# Data sources READ things that already exist and that Terraform does not
# manage (an existing network, an image ID, the current account).
# Use them elsewhere as data.<TYPE>.<NAME>.<attribute>.
#
# Fill in:
#   DATA_SOURCE_TYPE → the data source type (replace the word itself)
#   DATA_NAME        → your label for it
#   arguments        → the filters/lookups it needs
#
# Copy the block once per data source. Delete it if you don't need any.
# =============================================================================

data "DATA_SOURCE_TYPE" "DATA_NAME" {
  # arguments go here
}

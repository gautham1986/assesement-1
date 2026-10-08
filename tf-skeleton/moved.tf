# =============================================================================
# STEP 9 — moved.tf  (only needed if you RENAMED something)
# Tells Terraform "this resource only got a new name, it's the same thing".
# Without this, a renamed resource is destroyed and recreated.
#
# Fill in, per rename (then uncomment the block):
#   from → the OLD address, e.g. RESOURCE_TYPE.OLD_NAME
#   to   → the NEW address, e.g. RESOURCE_TYPE.NEW_NAME
#
# Once a plan shows "has moved to" and you've applied it, these blocks
# can stay or be removed later.
# =============================================================================

# moved {
#   from = RESOURCE_TYPE.OLD_NAME
#   to   = RESOURCE_TYPE.NEW_NAME
# }

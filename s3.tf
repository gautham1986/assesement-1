# ---------- Bucket for the static site ----------
resource "aws_s3_bucket" "site" {
  # Bucket names are global across all of AWS, so add the account ID
  bucket        = "${local.name_prefix}-site-${data.aws_caller_identity.current.account_id}"
  force_destroy = true # lets 'terraform destroy' delete it even with files inside

  tags = {
    Name = "${local.name_prefix}-site"
  }
}

resource "aws_s3_bucket_public_access_block" "site" {
  bucket                  = aws_s3_bucket.site.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# ---------- Upload every file in ./site ----------
resource "aws_s3_object" "site" {
  for_each = fileset("${path.module}/site", "**")

  bucket = aws_s3_bucket.site.id
  key    = each.value
  source = "${path.module}/site/${each.value}"
  etag   = filemd5("${path.module}/site/${each.value}")
}
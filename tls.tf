# Only build the self-signed certificate when no real one is given
locals {
  use_self_signed = var.acm_certificate_arn == ""
}

# ---------- 1. A private key ----------
resource "tls_private_key" "alb" {
  count     = local.use_self_signed ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = 2048
}

# ---------- 2. A certificate signed by that key ----------
resource "tls_self_signed_cert" "alb" {
  count           = local.use_self_signed ? 1 : 0
  private_key_pem = tls_private_key.alb[0].private_key_pem

  subject {
    common_name  = "${local.name_prefix}.internal"
    organization = var.project
  }

  validity_period_hours = 8760 # 1 year

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

# ---------- 3. Import it into ACM so the ALB can use it ----------
resource "aws_acm_certificate" "self_signed" {
  count            = local.use_self_signed ? 1 : 0
  private_key      = tls_private_key.alb[0].private_key_pem
  certificate_body = tls_self_signed_cert.alb[0].cert_pem

  tags = {
    Name = "${local.name_prefix}-self-signed"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# ---------- The one value the ALB listener will use ----------
locals {
  certificate_arn = local.use_self_signed ? aws_acm_certificate.self_signed[0].arn : var.acm_certificate_arn
}

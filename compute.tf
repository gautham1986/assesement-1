# ---------- Latest Ubuntu 24.04 image from Canonical ----------
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# ---------- 3 nginx instances, one per backend subnet ----------
resource "aws_instance" "app" {
  count = length(aws_subnet.backend)

  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.backend[count.index].id
  vpc_security_group_ids      = [aws_security_group.app.id]
  iam_instance_profile        = aws_iam_instance_profile.app.name
  associate_public_ip_address = false

  metadata_options {
    http_tokens = "required" # IMDSv2 only
  }

  root_block_device {
    volume_type = "gp3"
    encrypted   = true
  }

  user_data = var.bootstrap_with_user_data ? templatefile("${path.module}/scripts/user_data.sh.tftpl", {
    bucket = aws_s3_bucket.site.bucket
    region = var.region
  }) : null
  user_data_replace_on_change = true

  tags = {
    Name = "${local.name_prefix}-nginx-${local.azs[count.index]}"
    Role = "nginx"
  }

  # The script needs internet (NAT) and S3 (endpoint) the moment it boots
  depends_on = [
    aws_route_table_association.backend,
    aws_nat_gateway.main,
    aws_vpc_endpoint.s3,
  ]

  lifecycle {
    ignore_changes = [ami] # don't rebuild every time Canonical publishes a new image
  }
}

# ---------- VPC ----------
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${local.name_prefix}-vpc"
  }
}

# ---------- Internet gateway: the VPC's door to the internet ----------
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.name_prefix}-igw"
  }
}

# ---------- Subnets: 3 tiers x 3 AZs ----------
resource "aws_subnet" "frontend" {
  count             = length(var.frontend_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.frontend_subnet_cidrs[count.index]
  availability_zone = local.azs[count.index]

  tags = {
    Name = "${local.name_prefix}-frontend-${local.azs[count.index]}"
    Tier = "frontend"
  }
}

resource "aws_subnet" "backend" {
  count             = length(var.backend_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.backend_subnet_cidrs[count.index]
  availability_zone = local.azs[count.index]

  tags = {
    Name = "${local.name_prefix}-backend-${local.azs[count.index]}"
    Tier = "backend"
  }
}

resource "aws_subnet" "database" {
  count             = length(var.database_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.database_subnet_cidrs[count.index]
  availability_zone = local.azs[count.index]

  tags = {
    Name = "${local.name_prefix}-database-${local.azs[count.index]}"
    Tier = "database"
  }
}

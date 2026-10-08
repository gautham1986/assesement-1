# ---------- NAT gateway (AZ a) ----------
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "${local.name_prefix}-nat-eip"
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.frontend[0].id

  tags = {
    Name = "${local.name_prefix}-nat"
  }

  depends_on = [aws_internet_gateway.main]
}

# ---------- Blackhole target: an ENI that is never attached ----------
resource "aws_network_interface" "blackhole" {
  subnet_id   = aws_subnet.database[0].id
  description = "Never attached. Database default route points here so traffic is dropped."

  tags = {
    Name = "${local.name_prefix}-blackhole-eni"
  }
}

# ---------- Route tables (one per tier) ----------
resource "aws_route_table" "frontend" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${local.name_prefix}-rt-frontend"
  }
}

resource "aws_route_table" "backend" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name = "${local.name_prefix}-rt-backend"
  }
}

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = aws_network_interface.blackhole.id
  }

  tags = {
    Name = "${local.name_prefix}-rt-database"
  }
}

# ---------- Attach each subnet to its tier's route table ----------
resource "aws_route_table_association" "frontend" {
  count          = length(aws_subnet.frontend)
  subnet_id      = aws_subnet.frontend[count.index].id
  route_table_id = aws_route_table.frontend.id
}

resource "aws_route_table_association" "backend" {
  count          = length(aws_subnet.backend)
  subnet_id      = aws_subnet.backend[count.index].id
  route_table_id = aws_route_table.backend.id
}

resource "aws_route_table_association" "database" {
  count          = length(aws_subnet.database)
  subnet_id      = aws_subnet.database[count.index].id
  route_table_id = aws_route_table.database.id
}

# ---------- S3 gateway endpoint (free; keeps S3 traffic off the NAT) ----------
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.backend.id]

  tags = {
    Name = "${local.name_prefix}-s3-endpoint"
  }
}

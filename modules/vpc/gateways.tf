# --------------------------------------------------------------------------------------------------------
# Internet Gateway
# --------------------------------------------------------------------------------------------------------
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc-default.id
  count  = var.ig-attached ? 1 : 0
  region = var.aws_region

  tags = {
    "Name" = "${var.vpc-name}-ig"
  }
}

# --------------------------------------------------------------------------------------------------------
# NAT Gateway
# --------------------------------------------------------------------------------------------------------
resource "aws_nat_gateway" "nat_gw" {
  count         = var.nat-attached ? 1 : 0
  region        = var.aws_region
  allocation_id = aws_eip.nat_eip[0].id
  subnet_id     = aws_subnet.public-subnets[0].id

  tags = {
    Name = "${var.vpc-name}-nat-gw"
  }
}

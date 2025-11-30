# --------------------------------------------------------------------------------------------------------
# Public Route Table
# --------------------------------------------------------------------------------------------------------
resource "aws_route_table" "public-route-table" {
  count  = length(var.public-subnets-cidr) > 0 && var.public-subnets > 0 ? 1 : 0
  vpc_id = aws_vpc.vpc-default.id
 region = var.aws_region

  tags = {
    Name = "pub-${var.vpc-name}-rt"
  }
}

# --------------------------------------------------------------------------------------------------------
# Private Route Table
# --------------------------------------------------------------------------------------------------------
resource "aws_route_table" "private-route-table" {
  count  = length(var.private-subnets-cidr) > 0  && var.private-subnets > 0 ? 1 : 0
  vpc_id = aws_vpc.vpc-default.id
   region = var.aws_region

  tags = {
    Name = "pr-${var.vpc-name}-rt"
  }
}

# --------------------------------------------------------------------------------------------------------
# NAT Route Table
# --------------------------------------------------------------------------------------------------------
resource "aws_route_table" "nat-route-table" {
  count  = length(var.nat-subnets-cidr) > 0 && var.nat-attached ? 1 : 0
  vpc_id = aws_vpc.vpc-default.id
   region = var.aws_region

  tags = {
    Name = "nat-${var.vpc-name}-rt"
  }
}

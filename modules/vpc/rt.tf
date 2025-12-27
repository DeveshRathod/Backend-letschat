# --------------------------------------------------------------------------------------------------------
# Public Route Table
# --------------------------------------------------------------------------------------------------------
resource "aws_route_table" "public-route-table" {
  count  = length(var.public_subnets_cidr) > 0 && var.public_subnets > 0 ? 1 : 0
  vpc_id = aws_vpc.vpc-default.id
 region = var.aws_region

  tags = {
    Name = "pub-${var.vpc_name}-rt"
  }
}

# --------------------------------------------------------------------------------------------------------
# Private Route Table
# --------------------------------------------------------------------------------------------------------
resource "aws_route_table" "private-route-table" {
  count  = length(var.private_subnets_cidr) > 0  && var.private_subnets > 0 ? 1 : 0
  vpc_id = aws_vpc.vpc-default.id
   region = var.aws_region

  tags = {
    Name = "pr-${var.vpc_name}-rt"
  }
}

# --------------------------------------------------------------------------------------------------------
# NAT Route Table
# --------------------------------------------------------------------------------------------------------
resource "aws_route_table" "nat-route-table" {
  count  = length(var.nat_subnets_cidr) > 0 && var.nat_attached ? 1 : 0
  vpc_id = aws_vpc.vpc-default.id
   region = var.aws_region

  tags = {
    Name = "nat-${var.vpc_name}-rt"
  }
}

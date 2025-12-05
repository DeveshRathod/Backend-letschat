# --------------------------------------------------------------------------------------------------------
# Public Route
# --------------------------------------------------------------------------------------------------------
resource "aws_route" "public-route" {
  count = var.ig_attached ? 1 : 0
   region = var.aws_region
  route_table_id         = aws_route_table.public-route-table[0].id
  gateway_id             = aws_internet_gateway.internet-gateway[0].id
  destination_cidr_block = "0.0.0.0/0"
}

# --------------------------------------------------------------------------------------------------------
# NAT Route
# --------------------------------------------------------------------------------------------------------
resource "aws_route" "nat-route" {
  count = var.nat_attached ? 1 : 0
   region = var.aws_region
  route_table_id         = aws_route_table.nat-route-table[0].id
  gateway_id             = aws_nat_gateway.nat_gw[0].id
  destination_cidr_block = "0.0.0.0/0"
}

# --------------------------------------------------------------------------------------------------------
# Public Subnet Association
# --------------------------------------------------------------------------------------------------------
resource "aws_route_table_association" "public-rt-association" {
  count = length(aws_subnet.public-subnets)
   region = var.aws_region
  subnet_id      = aws_subnet.public-subnets[count.index].id
  route_table_id = aws_route_table.public-route-table[0].id
}

# --------------------------------------------------------------------------------------------------------
# Private Subnet Association
# --------------------------------------------------------------------------------------------------------
resource "aws_route_table_association" "private-rt-association" {
  count = length(aws_subnet.private-subnets)
   region = var.aws_region
  subnet_id      = aws_subnet.private-subnets[count.index].id
  route_table_id = aws_route_table.private-route-table[0].id
}

# --------------------------------------------------------------------------------------------------------
# NAT Subnet Association
# --------------------------------------------------------------------------------------------------------
resource "aws_route_table_association" "nat-rt-association" {
  count = var.nat_attached ? length(aws_subnet.nat-private-subnets) : 0
   region = var.aws_region
  subnet_id      = aws_subnet.nat-private-subnets[count.index].id
  route_table_id = aws_route_table.nat-route-table[0].id
}

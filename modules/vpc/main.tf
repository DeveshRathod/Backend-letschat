# --------------------------------------------------------------------------------------------------------
# VPC
# --------------------------------------------------------------------------------------------------------
resource "aws_vpc" "vpc-default" {
  cidr_block = var.cidr-for-vpc
 region = var.aws_region
  tags = {
    Name = var.vpc-name
  }
}

# --------------------------------------------------------------------------------------------------------
# Get Availability Zones
# --------------------------------------------------------------------------------------------------------
data "aws_availability_zones" "available" {
   region = var.aws_region
}

# --------------------------------------------------------------------------------------------------------
# Public Subnets
# --------------------------------------------------------------------------------------------------------
resource "aws_subnet" "public-subnets" {
  count = var.public-subnets
   region = var.aws_region
  vpc_id = aws_vpc.vpc-default.id
  cidr_block = var.public-subnets-cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[
    count.index % length(data.aws_availability_zones.available.names)
  ]

  tags = {
    Name = "${var.vpc-name}-pub-${count.index + 1}"
  }
}

# --------------------------------------------------------------------------------------------------------
# Private Subnets
# --------------------------------------------------------------------------------------------------------
resource "aws_subnet" "private-subnets" {
  count = var.private-subnets
   region = var.aws_region
  vpc_id = aws_vpc.vpc-default.id
  cidr_block = var.private-subnets-cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[
    count.index % length(data.aws_availability_zones.available.names)
  ]

  tags = {
    Name = "${var.vpc-name}-pri-${count.index + 1}"
  }
}

# --------------------------------------------------------------------------------------------------------
# NAT Private Subnets
# --------------------------------------------------------------------------------------------------------
resource "aws_subnet" "nat-private-subnets" {
  count = var.nat-attached ? var.nat-attached-subnets : 0
   region = var.aws_region
  vpc_id = aws_vpc.vpc-default.id
  cidr_block = var.nat-subnets-cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[
    count.index % length(data.aws_availability_zones.available.names)
  ]

  tags = {
    Name = "${var.vpc-name}-pri-nat-${count.index + 1}"
  }
}

# --------------------------------------------------------------------------------------------------------
# NAT EIP
# --------------------------------------------------------------------------------------------------------
resource "aws_eip" "nat_eip" {
  count = var.nat-attached ? 1 : 0
   region = var.aws_region

  tags = {
    Name = "${var.vpc-name}-nat-eip"
  }
}

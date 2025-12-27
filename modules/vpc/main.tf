# --------------------------------------------------------------------------------------------------------
# VPC
# --------------------------------------------------------------------------------------------------------
resource "aws_vpc" "vpc-default" {
  cidr_block = var.cidr_for_vpc

  enable_dns_support   = true
  enable_dns_hostnames = true
 region = var.aws_region
  tags = {
    Name = var.vpc_name
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
  count = var.public_subnets
   region = var.aws_region
  vpc_id = aws_vpc.vpc-default.id
  cidr_block = var.public_subnets_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[
    count.index % length(data.aws_availability_zones.available.names)
  ]

  tags = {
    Name = "${var.vpc_name}-pub-${count.index + 1}"
  }
}

# --------------------------------------------------------------------------------------------------------
# Private Subnets
# --------------------------------------------------------------------------------------------------------
resource "aws_subnet" "private-subnets" {
  count = var.private_subnets
   region = var.aws_region
  vpc_id = aws_vpc.vpc-default.id
  cidr_block = var.private_subnets_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[
    count.index % length(data.aws_availability_zones.available.names)
  ]

  tags = {
    Name = "${var.vpc_name}-pri-${count.index + 1}"
  }
}

# --------------------------------------------------------------------------------------------------------
# NAT Private Subnets
# --------------------------------------------------------------------------------------------------------
resource "aws_subnet" "nat-private-subnets" {
  count = var.nat_attached ? var.nat_attached_subnets : 0
   region = var.aws_region
  vpc_id = aws_vpc.vpc-default.id
  cidr_block = var.nat_subnets_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[
    count.index % length(data.aws_availability_zones.available.names)
  ]

  tags = {
    Name = "${var.vpc_name}-pri-nat-${count.index + 1}"
  }
}

# --------------------------------------------------------------------------------------------------------
# NAT EIP
# --------------------------------------------------------------------------------------------------------
resource "aws_eip" "nat_eip" {
  count = var.nat_attached ? 1 : 0
   region = var.aws_region

  tags = {
    Name = "${var.vpc_name}-nat-eip"
  }
}

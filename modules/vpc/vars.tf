variable "public_subnets" {
  description = "Number of public subnets to create in the VPC"
  type        = number
}

variable "private_subnets" {
  description = "Number of private subnets to create in the VPC"
  type        = number
}

variable "aws_region" {
  description = "AWS region to deploy resources"
}

variable "vpc_name" {
  description = "Name assigned to the VPC resource"
  type        = string
}

variable "ig_attached" {
  description = "Flag to control whether an Internet Gateway should be created and attached to the VPC"
  type        = bool
}

variable "nat_attached" {
  description = "Flag to control whether a NAT Gateway should be created for private subnets"
  type        = bool
}

variable "nat_attached_subnets" {
  description = "Number of private subnets that should route outbound traffic through the NAT Gateway"
  type        = number
}

variable "cidr_for_vpc" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets_cidr" {
  description = "List of CIDR blocks for each public subnet (should match the number specified in public_subnets)"
  type        = list(string)
}

variable "private_subnets_cidr" {
  description = "List of CIDR blocks for each private subnet (should match the number specified in private_subnets)"
  type        = list(string)
}

variable "nat_subnets_cidr" {
  description = "List of CIDR blocks for each private subnet (should match the number specified in private-subnets)"
  type        = list(string)
}


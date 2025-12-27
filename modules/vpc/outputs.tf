output "vpc_id" {
  value       = aws_vpc.vpc-default.id
  description = "ID of the VPC created in this module."
}

output "public_subnets" {
  value       = aws_subnet.public-subnets[*].id
  description = "List of IDs for all public subnets."
}


output "private_subnets" {
  value       = aws_subnet.private-subnets[*].id
  description = "List of IDs for standard private subnets (without NAT)."
}


output "nat_private_subnets_ids" {
  value       = aws_subnet.nat-private-subnets[*].id
  description = "List of IDs for private subnets routed through NAT Gateways."
}


output "all_private_route_table_ids" {
  value = concat(
    aws_route_table.private-route-table[*].id,
    aws_route_table.nat-route-table[*].id
  )
  description = "Combined list of route table IDs for private and NAT private subnets."
}

output "all_private_subnets" {
  value = concat(
    aws_subnet.private-subnets[*].id,
    aws_subnet.nat-private-subnets[*].id
  )
  description = "Combined list of all private subnet IDs (standard + NAT private)."
}

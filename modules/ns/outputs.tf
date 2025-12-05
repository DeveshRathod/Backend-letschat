output "aws_service_discovery_private_dns_namespace_id" {
  value = aws_service_discovery_private_dns_namespace.letschat_namespace.id
  description = "Id of namespace"
}

output "aws_service_discovery_private_dns_namespace_arn" {
  value = aws_service_discovery_private_dns_namespace.letschat_namespace.arn
  description = "ARN of namespace"
}
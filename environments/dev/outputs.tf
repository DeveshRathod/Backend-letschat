output "vpc_id" {
  description = "The ID of the VPC created by the VPC module."
  value       = module.vpc_module.vpc_id
}

output "public_subnets" {
  description = "List of public subnet IDs created for external-facing resources."
  value       = module.vpc_module.public_subnets
}

output "private_subnets" {
  description = "List of private subnet IDs used for internal ECS tasks and services."
  value       = module.vpc_module.private_subnets
}

output "nat_private_subnets" {
  description = "List of private subnets routed through NAT for outbound internet access."
  value       = module.vpc_module.nat_private_subnets_ids
}

output "security_group_id" {
  description = "The security group ID exposed by the security group module."
  value       = module.sg_module.sg_id
}

output "ecs_cluster_name" {
  description = "The name of the ECS cluster created."
  value       = module.ecs_module.ecs_cluster_name
}

output "ecs_cluster_arn" {
  description = "The ARN of the ECS cluster created."
  value       = module.ecs_module.ecs_cluster_arn
}

output "service_discovery_namespace_id" {
  description = "Service discovery namespace ID used for ECS service service mesh."
  value       = module.ns_module.aws_service_discovery_private_dns_namespace_id
}

output "service_discovery_namespace_name" {
  description = "Service discovery namespace name for internal DNS resolution."
  value       = module.ns_module.aws_service_discovery_private_dns_namespace_name
}

output "backend_service_discovery_name" {
  description = "The Cloud Map service discovery service name for backend."
  value       = module.service_module.service_discovery_name
}

output "backend_service_discovery_arn" {
  description = "The ARN of the Cloud Map service discovery service for backend."
  value       = module.service_module.service_discovery_arn
}

output "ecs_task_role_name" {
  description = "IAM role name used by ECS tasks to access AWS resources."
  value       = module.iam_module.ecs_task_role_arn
}

output "ecs_task_role_arn" {
  description = "The ARN of the ECS task IAM role."
  value       = module.iam_module.ecs_task_role_arn
}

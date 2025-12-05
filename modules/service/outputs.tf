output "service_name" {
  value       = aws_ecs_service.this.name
  description = "Name of the ECS service created by this module."
}

output "cloudmap_service_arn" {
  value       = aws_service_discovery_service.this.arn
  description = "ARN of the AWS Cloud Map service registered for service discovery."
}

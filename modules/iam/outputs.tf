output "ecs_task_role_arn" {
  description = "ARN of the ECS task IAM role"
  value       = aws_iam_role.ecs_task_role.arn
}

output "ecs_task_role_name" {
  description = "Name of the ECS task IAM role"
  value       = aws_iam_role.ecs_task_role.name
}

output "ecs_task_policy_arn" {
  description = "ARN of the custom ECS task IAM policy"
  value       = aws_iam_policy.ecs_task_policy.arn
}

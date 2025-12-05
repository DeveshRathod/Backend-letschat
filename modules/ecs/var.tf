variable "aws_region" {
  type        = string
  description = "AWS region where all ECS, networking, and IAM resources will be deployed."
}

variable "ecs_family_name" {
  type        = string
  description = "ECS task definition family name. Also used as the container name."
}

variable "ecs_image" {
  type        = string
  description = "Full Docker image URI (ECR or public registry) used by the ECS container."
}

variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster where the task will be deployed."
}

variable "log_group_name" {
  type        = string
  description = "CloudWatch Log Group name for ECS task/container logs."
}

variable "log_retention" {
  type        = number
  description = "Number of days to retain ECS container logs in CloudWatch."
}

variable "cpu" {
  type        = string
  description = "CPU units allocated to the ECS task definition (e.g., 256, 512, 1024)."
}

variable "memory" {
  type        = string
  description = "Memory (in MB) allocated to the ECS task definition (e.g., 512, 1024)."
}

variable "network_mode" {
  type        = string
  description = "Docker networking mode used for the ECS task (FARGATE requires 'awsvpc')."
}

variable "requires_compatibilities" {
  type        = list(string)
  description = "Launch types supported by this task definition (e.g., [\"FARGATE\"])."
}

variable "operating_system_family" {
  type        = string
  description = "Operating system for the ECS task (e.g., LINUX)."
}

variable "cpu_architecture" {
  type        = string
  description = "CPU architecture used by the task (e.g., X86_64 or ARM64)."
}

variable "ecs_container_port" {
  type        = number
  description = "Port exposed by the ECS container for ingress traffic."
}

variable "ecs_node_env" {
  type        = string
  description = "Environment value to set in the container (e.g., dev, qa, prod)."
}

variable "execution_role_arn" {
  type        = string
  description = "IAM Role ARN used by ECS agent to pull images and fetch secrets."
}

variable "task_role_arn" {
  type        = string
  description = "IAM Role ARN assumed by the application running inside the ECS task."
}

variable "secret_arn" {
  type        = string
  description = "AWS Secrets Manager ARN containing application environment variables."
}

variable "secret_keys" {
  type        = list(string)
  description = "List of secret keys to fetch from Secrets Manager for injecting into the container."
}

variable "healthcheck_command" {
  type        = list(string)
  description = "Command executed inside the container to determine container health."
}

variable "healthcheck_interval" {
  type        = number
  description = "Time (in seconds) between each container health check execution."
}

variable "healthcheck_timeout" {
  type        = number
  description = "Time (in seconds) allowed for a health check command to complete."
}

variable "healthcheck_retries" {
  type        = number
  description = "Number of failed health checks before the container is marked unhealthy."
}

variable "healthcheck_start_period" {
  type        = number
  description = "Grace period (seconds) before starting health checks after container startup."
}

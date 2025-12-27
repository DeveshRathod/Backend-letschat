variable "aws_region" {
  type        = string
  description = "AWS region where the ECS service and related resources will be deployed."
}

variable "service_name" {
  type        = string
  description = "Name of the ECS service to be created."
}

variable "cluster_arn" {
  type        = string
  description = "ARN of the ECS cluster where the service will run."
}

variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster (used for service discovery and CloudWatch metrics)."
}

variable "task_definition_arn" {
  type        = string
  description = "ARN of the ECS task definition to be used by the service."
}

variable "launch_type" {
  type        = string
  description = "Launch type for ECS tasks (e.g., FARGATE or EC2)."
}

variable "desired_count" {
  type        = number
  description = "Number of desired tasks to run in the ECS service."
}

variable "subnets" {
  type        = list(string)
  description = "List of subnets where the ECS tasks should run."
}

variable "security_groups" {
  type        = list(string)
  description = "List of security group IDs attached to the ECS service ENIs."
}

variable "assign_public_ip" {
  type        = bool
  description = "Assigns a public IP to ECS tasks (valid only when using awsvpc networking mode)."
}

variable "namespace_id" {
  type        = string
  description = "Cloud Map namespace ID for service discovery integration."
}

variable "dns_record_type" {
  type        = string
  description = "DNS record type for Cloud Map (e.g., A or SRV)."
}

variable "dns_ttl" {
  type        = number
  description = "Time-to-live (TTL) for DNS records registered in Cloud Map."
}

variable "routing_policy" {
  type        = string
  description = "Cloud Map routing policy (e.g., MULTIVALUE or WEIGHTED)."
}

variable "min_capacity" {
  type        = number
  description = "Minimum number of tasks allowed in the ECS auto scaling configuration."
}

variable "max_capacity" {
  type        = number
  description = "Maximum number of tasks allowed in the ECS auto scaling configuration."
}

variable "metric_type" {
  type        = string
  description = "Type of CloudWatch metric used for auto scaling (e.g., CPUUtilization or MemoryUtilization)."
}

variable "target_value" {
  type        = number
  description = "Target metric value that auto scaling tries to maintain."
}

variable "scale_in_cooldown" {
  type        = number
  description = "Cooldown period (in seconds) after scaling in, before another scale-in event can occur."
}

variable "scale_out_cooldown" {
  type        = number
  description = "Cooldown period (in seconds) after scaling out, before another scale-out event can occur."
}

variable "service_namespace" {
  type        = string
  description = "Application Auto Scaling namespace (e.g., ecs)."
}

variable "scalable_dimension" {
  type        = string
  description = "Scalable dimension for ECS service auto scaling (e.g., ecs:service:DesiredCount)."
}

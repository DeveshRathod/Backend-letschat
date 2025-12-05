################################################################################################################
# GLOBAL VARIABLES
################################################################################################################
variable "aws_region" {
  description = "AWS Region"
  type        = string
}

################################################################################################################
# VPC VARIABLES
################################################################################################################
variable "vpc_name" {
  description = "Name for VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR range for VPC"
  type        = string
}

variable "private_subnets" {
  description = "Number of private subnets to create"
  type        = number
}

variable "public_subnets" {
  description = "Number of public subnets to create"
  type        = number
}

variable "nat_attached_subnets" {
  description = "Number of subnets for NAT gateways"
  type        = number
}

variable "nat_attached" {
  description = "Whether to attach NAT gateway"
  type        = bool
}

variable "ig_attached" {
  description = "Whether to attach Internet Gateway"
  type        = bool
}

variable "private_subnets_cidr" {
  description = "List of CIDRs for private subnets"
  type        = list(string)
}

variable "public_subnets_cidr" {
  description = "List of CIDRs for public subnets"
  type        = list(string)
}

variable "nat_subnets_cidr" {
  description = "List of CIDRs for NAT subnets"
  type        = list(string)
}

################################################################################################################
# SG VARIABLES
################################################################################################################
variable "sg_name" {
  description = "Security group name"
  type        = string
}

variable "sg_ports" {
  description = "List of SG port rules"
  type = list(object({
    from        = number
    to          = number
    protocol    = string
    cidr        = list(string)
    description = string
  }))
}

################################################################################################################
# NS VARIABLES
################################################################################################################
variable "namespace_name" {
  type        = string
  description = "Private DNS Namespace name"
}

variable "namespace_description" {
  type        = string
  description = "Description for the namespace"
}

variable "namespace_tags" {
  type        = map(string)
  description = "Tags for the namespace"
}

################################################################################################################
# SM VARIABLES
################################################################################################################
variable "secret_name" {
  type        = string
  description = "Name of the secret in Secrets Manager"
}

variable "secret_description" {
  type        = string
  description = "Description of the secret"
}

variable "secret_tags" {
  type        = map(string)
  description = "Tags to apply to the secret"
}

variable "secret_for_sm" {
  type        = map(any)
  description = "The secret data in JSON format"
}

################################################################################################################
# IAM VARIABLES
################################################################################################################
variable "role_name" {
  type        = string
  description = "Name of the ECS task IAM role"
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the ECS IAM role"
}

variable "custom_policy_name" {
  type        = string
  description = "Name of the custom IAM policy to create"
}

variable "execution_policy_arn" {
  type        = string
  description = "ARN of standard ECS execution policy to attach"
}

variable "custom_policy_description" {
  type        = string
  description = "Description of the custom IAM policy"
}

variable "s3_bucket_name" {
  type        = string
  description = "S3 bucket name to allow access for ECS tasks"
}

################################################################################################################
# ECS VARIABLES (TASK DEFINITION)
################################################################################################################
variable "ecs_family_name" {
  type        = string
  description = "Name of the ECS task definition family (also used as the container name)."
}

variable "ecs_image" {
  type        = string
  description = "Full Docker image URI (ECR or public registry) used by the ECS container."
}

variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster where the service and tasks will run."
}

variable "log_group_name" {
  type        = string
  description = "CloudWatch Log Group name for storing application logs."
}

variable "log_retention" {
  type        = number
  description = "Retention period (in days) for CloudWatch logs."
}

variable "cpu" {
  type        = string
  description = "Amount of CPU units allocated to the ECS task definition."
}

variable "memory" {
  type        = string
  description = "Amount of memory (in MiB) allocated to the ECS task definition."
}

variable "network_mode" {
  type        = string
  description = "Docker networking mode for the ECS task (e.g., awsvpc, bridge)."
}

variable "requires_compatibilities" {
  type        = list(string)
  description = "Launch type for ECS (e.g., [\"FARGATE\"], [\"EC2\"])."
}

variable "operating_system_family" {
  type        = string
  description = "Operating system for the ECS task definition (e.g., LINUX)."
}

variable "cpu_architecture" {
  type        = string
  description = "CPU architecture for the container (e.g., X86_64, ARM64)."
}

variable "ecs_container_port" {
  type        = number
  description = "Port on which the container listens for incoming traffic."
}

variable "ecs_node_env" {
  type        = string
  description = "Application runtime environment (dev/stage/prod)."
}

variable "secret_keys" {
  type        = list(string)
  description = "List of secret environment variable names mapped from AWS Secrets Manager."
}

variable "healthcheck_command" {
  type        = list(string)
  description = "Command executed by ECS to determine container health."
}

variable "healthcheck_interval" {
  type        = number
  description = "Time (in seconds) between health check executions."
}

variable "healthcheck_timeout" {
  type        = number
  description = "Time (in seconds) after which a health check is considered failed."
}

variable "healthcheck_retries" {
  type        = number
  description = "Number of retry attempts before marking the container unhealthy."
}

variable "healthcheck_start_period" {
  type        = number
  description = "Grace period (in seconds) before starting health checks."
}

################################################################################################################
# ECS SERVICE VARIABLES 
################################################################################################################
variable "service_name" {
  type        = string
  description = "Name of the ECS service to be created."
}

variable "launch_type" {
  type        = string
  description = "Launch type for ECS service (FARGATE or EC2)."
}

variable "desired_count" {
  type        = number
  description = "Number of desired tasks for the ECS service."
}

variable "assign_public_ip" {
  type        = bool
  description = "Assigns public IP to tasks (only for awsvpc mode)."
}

variable "dns_record_type" {
  type        = string
  description = "DNS record type for service discovery (A or SRV)."
}

variable "dns_ttl" {
  type        = number
  description = "TTL for Cloud Map DNS records."
}

variable "routing_policy" {
  type        = string
  description = "Routing policy for Cloud Map (MULTIVALUE or WEIGHTED)."
}

variable "min_capacity" {
  type        = number
  description = "Minimum tasks for ECS auto scaling."
}

variable "max_capacity" {
  type        = number
  description = "Maximum tasks for ECS auto scaling."
}

variable "metric_type" {
  type        = string
  description = "CloudWatch metric for auto scaling (CPU or Memory)."
}

variable "target_value" {
  type        = number
  description = "Target value for auto scaling metric."
}

variable "scale_in_cooldown" {
  type        = number
  description = "Scale-in cooldown period in seconds."
}

variable "scale_out_cooldown" {
  type        = number
  description = "Scale-out cooldown period in seconds."
}

variable "service_namespace" {
  type        = string
  description = "Auto Scaling namespace (ecs)."
}

variable "scalable_dimension" {
  type        = string
  description = "Scalable dimension (ecs:service:DesiredCount)."
}

################################################################################################################
# ENDPOINT VARIABLES
################################################################################################################
variable "enable_logs" {
  type        = bool
  description = "Enable VPC endpoint for CloudWatch Logs."
}

variable "enable_ecr_api" {
  type        = bool
  description = "Enable VPC endpoint for ECR API."
}

variable "enable_ecr_dkr" {
  type        = bool
  description = "Enable VPC endpoint for ECR Docker Registry."
}

variable "enable_s3_gateway" {
  type        = bool
  description = "Enable S3 Gateway Endpoint for private S3 access."
}

variable "enable_secretsmanager" {
  type        = bool
  description = "Enable VPC endpoint for Secrets Manager."
}

variable "endpoint_tags" {
  type        = map(string)
  description = "Tags to apply to all VPC endpoints."
}

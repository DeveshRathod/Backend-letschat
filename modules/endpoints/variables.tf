variable "vpc_id" {
  type        = string
  description = "ID of the VPC where all interface and gateway endpoints will be created."
}

variable "aws_region" {
  type        = string
  description = "AWS region used for resolving service endpoint DNS names."
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet IDs where interface endpoints will be attached."
}

variable "private_route_tables" {
  type        = list(string)
  description = "List of route table IDs for creating S3 Gateway VPC endpoint routes."
}

variable "security_group_id" {
  type        = string
  description = "Security group ID attached to all interface VPC endpoints."
}

variable "enable_logs" {
  type        = bool
  description = "Enable or disable CloudWatch Logs for VPC Endpoint services that support logging."
}

variable "enable_ecr_api" {
  type        = bool
  description = "Create ECR API interface endpoint (com.amazonaws.<region>.ecr.api)."
}

variable "enable_ecr_dkr" {
  type        = bool
  description = "Create ECR Docker interface endpoint (com.amazonaws.<region>.ecr.dkr)."
}

variable "enable_s3_gateway" {
  type        = bool
  description = "Create S3 Gateway VPC endpoint for private access to Amazon S3."
}

variable "enable_secretsmanager" {
  type        = bool
  description = "Create Secrets Manager interface endpoint for private secret access."
}

variable "endpoint_tags" {
  type        = map(string)
  description = "Additional tags to be applied to all VPC endpoint resources."
}

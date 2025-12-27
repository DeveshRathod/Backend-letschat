variable "aws_region" {
  default = "AWS region"
}

variable "role_name" {
  type        = string
  description = "Name of the ECS task IAM role"
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the ECS IAM role"
}

variable "execution_policy_arn" {
  type        = string
  description = "ARN of standard ECS execution policy to attach"
}

variable "custom_policy_name" {
  type        = string
  description = "Name of the custom IAM policy to create"
}

variable "custom_policy_description" {
  type        = string
  description = "Description of the custom IAM policy"
}

variable "s3_bucket_name" {
  type        = string
  description = "S3 bucket name to allow access for ECS tasks"
}

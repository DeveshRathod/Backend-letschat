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

variable "aws_region" {
  type = string
  description = "AWS region"
}

variable "aws_region" {
  type        = string
   description = "AWS region to deploy resources"
}

variable "namespace_name" {
  type        = string
  description = "Name of the Private DNS namespace"
}

variable "namespace_description" {
  type        = string
  description = "Description for the Private DNS namespace"
}

variable "namespace_tags" {
  type        = map(string)
  description = "Tags for the namespace"
}

variable "vpc_id" {
  type = string
  description = "VPC id"
}

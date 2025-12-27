variable "sg_name" {
  description = "Name of the security Group"
  type = string
}

variable "sg_description" {
  description = "Description of the security Group"
  type = string
}

variable "aws_region" {
  description = "AWS region to deploy resources"
}

variable "sg_ports" {
  description = "Ports for security group"
  type = list(object({
    from = number
    to   = number
    cidr = list(string)
    description = string
    protocol = string
  }))
}

variable "vpc_id" {
  type = string
  description = "VPC ID where the security group will be created"
}

variable "sg_tags" {
  description = "Tags to be applied to the security group"
  type        = map(string)
  default     = {}
}

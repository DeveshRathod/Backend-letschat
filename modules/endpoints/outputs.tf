output "endpoint_ids" {
  value = {
    logs           = try(aws_vpc_endpoint.logs[0].id, null)
    ecr_api        = try(aws_vpc_endpoint.ecr_api[0].id, null)
    ecr_dkr        = try(aws_vpc_endpoint.ecr_dkr[0].id, null)
    s3             = try(aws_vpc_endpoint.s3[0].id, null)
    secretsmanager = try(aws_vpc_endpoint.secretsmanager[0].id, null)
  }

  description = "Map of VPC endpoint IDs created for logs, ECR API, ECR Docker, S3, and Secrets Manager."
}

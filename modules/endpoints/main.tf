# --------------------------------------------------------------------------------------------------------
# CloudWatch Logs Endpoint
# --------------------------------------------------------------------------------------------------------
resource "aws_vpc_endpoint" "logs" {
  count = var.enable_logs ? 1 : 0

  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${var.aws_region}.logs"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = var.private_subnets
  security_group_ids  = [var.security_group_id]
  private_dns_enabled = true

  tags = var.endpoint_tags
}

# --------------------------------------------------------------------------------------------------------
# ECR API Endpoint
# --------------------------------------------------------------------------------------------------------
resource "aws_vpc_endpoint" "ecr_api" {
  count = var.enable_ecr_api ? 1 : 0

  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${var.aws_region}.ecr.api"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = var.private_subnets
  security_group_ids  = [var.security_group_id]
  private_dns_enabled = true

  tags = var.endpoint_tags
}

# --------------------------------------------------------------------------------------------------------
# ECR DKR Endpoint
# --------------------------------------------------------------------------------------------------------
resource "aws_vpc_endpoint" "ecr_dkr" {
  count = var.enable_ecr_dkr ? 1 : 0

  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${var.aws_region}.ecr.dkr"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = var.private_subnets
  security_group_ids  = [var.security_group_id]
  private_dns_enabled = true

  tags = var.endpoint_tags
}

# --------------------------------------------------------------------------------------------------------
# S3 Gateway Endpoint
# --------------------------------------------------------------------------------------------------------
resource "aws_vpc_endpoint" "s3" {
  count = var.enable_s3_gateway ? 1 : 0

  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = var.private_route_tables

  tags = var.endpoint_tags
}

# --------------------------------------------------------------------------------------------------------
# Secrets Manager Endpoint
# --------------------------------------------------------------------------------------------------------
resource "aws_vpc_endpoint" "secretsmanager" {
  count = var.enable_secretsmanager ? 1 : 0

  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${var.aws_region}.secretsmanager"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = var.private_subnets
  security_group_ids  = [var.security_group_id]
  private_dns_enabled = true

  tags = var.endpoint_tags
}

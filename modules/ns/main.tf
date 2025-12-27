# --------------------------------------------------------------------------------------------------------
# Namespace
# --------------------------------------------------------------------------------------------------------
resource "aws_service_discovery_private_dns_namespace" "letschat_namespace" {
  region      = var.aws_region
  name        = var.namespace_name
  description = var.namespace_description
  vpc         = var.vpc_id

  tags = var.namespace_tags
}

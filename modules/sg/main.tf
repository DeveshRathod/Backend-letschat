# --------------------------------------------------------------------------------------------------------
# Create a security group with dynamic ingress and egress rules based on provided port configurations
# --------------------------------------------------------------------------------------------------------
resource "aws_security_group" "terra_sg" {
  name        = "terra-sg"
  region      = var.aws_region
  description = "Security group for dev-vpc"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.sg_ports
    content {
      from_port   = ingress.value.from
      to_port     = ingress.value.to
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr
      description = ingress.value.description
    }
  }

  dynamic "egress" {
    for_each = var.sg_ports
    content {
      from_port   = egress.value.from
      to_port     = egress.value.to
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr
      description = egress.value.description
    }
  }

  tags = {
    Name = "terra-sg"
  }
}

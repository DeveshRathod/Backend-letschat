output "sg_id" {
  value       = aws_security_group.terra_sg.id
  description = "ID of the security group created by this module."
}

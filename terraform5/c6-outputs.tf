# Terraform output variables

# Output latest generalised splat operator - return the list
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  # value       = aws_instance.myec2[*].public_ip
  value = toset([for instance in aws_instance.myec2 : instance.public_ip])
}

# Output latest generalised splat operator - return the list
output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  value       = toset([for instance in aws_instance.myec2 : instance.public_dns])
}

# Output latest generalised splat operator - return the list
output "instance_publicdns2" {
  description = "EC2 Instance Public DNS"
  value       = tomap({ for az, instance in aws_instance.myec2 : az => instance.public_dns })
}
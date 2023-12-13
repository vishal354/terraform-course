# Terraform output variables

# 1. For loop with list
# 2. For loop with map
# 3. For loop with map advanced
# 4. Legacy splat operator (latest) - returns list
# 5. Latest generalised splat operator - returns the list


# Output - for loop with list
output "for_output_list" {
  description = "For Loop with list"
  value       = [for instance in aws_instance.myec2 : instance.public_dns]
}

# Output - for loop with map
output "for_output_map1" {
  description = "For Loop with map"
  value       = { for instance in aws_instance.myec2 : instance.id => instance.public_dns }
}

# Output - for loop with map advanced
output "for_output_map2" {
  description = "For Loop with map - Advanced"
  value       = { for c, instance in aws_instance.myec2 : c => instance.public_dns }
}

# Output Legacy splat operator - returns the list
output "legacy_splat_instance_publicdns" {
  description = "Legacy Splat Operator"
  value = aws_instance.myec2.*.public_dns
}

# Output latest generalised splat operator - return the list
output "latest_splat_instance_publicdns" {
  description = "Generalised Latest Splat Operator"
  value = aws_instance.myec2[*].public_dns
}
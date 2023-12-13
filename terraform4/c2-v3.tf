# # Datasource
# data "aws_ec2_instance_type_offerings" "my_inst_type2" {
#   for_each = toset(["us-east-1a", "us-east-1e", "us-east-1c"])  
#   filter {
#     name   = "instance-type"
#     values = ["t3.micro"]
#   }

#   filter {
#     name   = "location"
#     # values = ["us-east-1a"]
#     values = [each.key]
#   }

#   location_type = "availability-zone"
# }

# # Output
# output "output_v2_1" {
# #   value = data.aws_ec2_instance_type_offerings.my_inst_type1.instance_types
#     value = toset([for t in data.aws_ec2_instance_type_offerings.my_inst_type2: t.instance_types])
# }

# # Output 2
# output "output_v2_2" {
#   value = {
#     for az, details in data.aws_ec2_instance_type_offerings.my_inst_type2: az => details.instance_types
#   }
# }
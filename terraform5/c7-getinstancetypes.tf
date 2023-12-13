# Availability Zone datastore
data "aws_availability_zones" "myazones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# Datasource
data "aws_ec2_instance_type_offerings" "my_inst_type" {
  for_each = toset(data.aws_availability_zones.myazones.names)
  filter {
    name   = "instance-type"
    values = [var.instance_type_map["prod"]]
  }

  filter {
    name = "location"
    # values = ["us-east-1a"]
    values = [each.key]
  }

  location_type = "availability-zone"
}

# Output 1
output "output_v3_1" {
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.my_inst_type : az => details.instance_types
  }
}

# Output 2 - Exclude unsupported regions
output "output_v3_2" {
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.my_inst_type :
    az => details.instance_types if length(details.instance_types) != 0
  }
}

# Output 3 - Exclude unsupported regions and show as list
output "output_v3_3" {
  value = keys({
    for az, details in data.aws_ec2_instance_type_offerings.my_inst_type :
    az => details.instance_types if length(details.instance_types) != 0
  })
}

# Output 4 - Additional Learning (Filters)
output "output_v3_4" {
  value = keys({
    for az, details in data.aws_ec2_instance_type_offerings.my_inst_type :
    az => details.instance_types if length(details.instance_types) != 0
  })[0]
}
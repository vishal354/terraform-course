# EC2 Instance
resource "aws_instance" "myec2" {
  ami           = data.aws_ami.amz_linux2.id
  instance_type = var.instance_type
  # instance_type = var.instance_type_list[0]
  # instance_type = var.instance_type_map["dev"]

  user_data = file("${path.module}/app1-install.sh")
  key_name  = var.instance_keypair
  vpc_security_group_ids = [
    aws_security_group.vpc-ssh.id,
    aws_security_group.vpc-web.id
  ]

  # Create EC2 Instances for all availability zones
  # for_each = toset(data.aws_availability_zones.myazones.names)
  for_each = toset(keys({
    for az, details in data.aws_ec2_instance_type_offerings.my_inst_type :
    az => details.instance_types if length(details.instance_types) != 0
  }))
  availability_zone = each.key
  tags = {
    "Name" = "For_each Demo ${each.value}"
  }
}



# Resource
# resource "aws_instance" "ec2demo" {
#   ami           = "ami-0230bd60aa48260c6"
#   instance_type = "t2.micro"
#   user_data = file("${path.module}/app1-install.sh")
#   tags = {
#     "Name" = "EC2 Demo Instance"
#   }
# }

resource "aws_instance" "ec2demo" {
  ami           = data.aws_ami.amz_linux2.id
  instance_type = var.instance_type
  user_data     = file("${path.module}/app1-install.sh")
  key_name      = var.instance_keypair
  vpc_security_group_ids = [
    aws_security_group.vpc-ssh.id,
    aws_security_group.vpc-web.id
  ]
  tags = {
    "Name" = "EC2 Demo 2"
  }
}

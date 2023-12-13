resource "aws_instance" "dove-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = var.INST_TYPE
  availability_zone      = var.ZONE1
  key_name               = "dove-key"
  vpc_security_group_ids = ["sg-043959beae58143d6"]
  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }
}
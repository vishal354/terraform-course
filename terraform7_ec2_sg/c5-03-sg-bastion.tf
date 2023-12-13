# Security group for the bastion host

module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name = "public-bastion-sg"
  description = "Security group with SSH port open for everybody(IPv4 CIDR), egress ports are all world open"
  vpc_id = module.vpc.vpc_id

  # Ingress rules and CIDR Blocks
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  # Egress rules and CIDR Blocks
  egress_rules = ["all-all"]
  tags = local.common_tags
}
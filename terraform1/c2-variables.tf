# Variables

variable "aws_region" {
  description = "Region in which AWS resources are to be created."
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "instance_keypair" {
  description = "AWS EC2 keypair that needs to be associated with EC2 instance"
  type        = string
  default     = "terraform-key"
}
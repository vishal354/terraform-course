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

variable "instance_type_list" {
  description = "EC2 Instance Type"
  type        = list(string)
  default     = ["t2.micro", "t2.small"]
}

variable "instance_type_map" {
  description = "EC2 Instance Type"
  type        = map(string)
  default = {
    "dev"  = "t2.micro"
    "qa"   = "t2.small"
    "prod" = "t3.small"
  }
}
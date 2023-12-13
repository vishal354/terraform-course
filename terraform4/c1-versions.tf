# Terraform block
terraform {
  required_version = "~> 1.6.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.30.0"
    }
  }
}

# Provider block
provider "aws" {
  region = var.aws_region
}


# Variables

variable "aws_region" {
  description = "Region in which AWS resources are to be created."
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment variable used as a prefix"
  type        = string
  default     = "dev"
}

variable "business_division" {
  description = "Business division in the large organisation this Int"
  type        = string
  default     = "SAP"
}
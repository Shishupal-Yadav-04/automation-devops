variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "aws_account_id" {
  description = "AWS account ID"
  type        = string
}

variable "aws_profile" {
  description = "AWS CLI profile to use"
  type        = string
}

variable "role_name" {
  description = "Name of the IAM role"
  type        = string
}
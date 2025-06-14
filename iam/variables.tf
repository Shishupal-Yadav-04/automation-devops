variable "role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "aws_account_id" {
  description = "AWS account ID"
  type        = string
}

variable "tags" {
  description = "Tags to apply to IAM resources"
  type        = map(string)
  default     = {}
}
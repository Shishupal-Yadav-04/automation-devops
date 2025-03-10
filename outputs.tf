output "iam_role_arn" {
  description = "ARN of the created IAM role"
  value       = module.iam_role.role_arn
}
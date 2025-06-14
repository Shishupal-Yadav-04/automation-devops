# Trust policy to allow role assumption from local (via AWS STS)
data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.aws_account_id}:root"]
    }
  }
}

# Create the IAM role
resource "aws_iam_role" "temp_admin_role" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

  # Set max session duration to 1 hour (3600 seconds)
  max_session_duration = 3600
}

# Attach the custom admin-no-delete policy
resource "aws_iam_role_policy" "admin_no_delete_policy" {
  name   = "AdminNoDeletePolicy"
  role   = aws_iam_role.temp_admin_role.id
  policy = file("${path.module}/policies/admin-no-delete.json")
}

# Attach AWS-managed AdministratorAccess policy
resource "aws_iam_role_policy_attachment" "admin_access" {
  role       = aws_iam_role.temp_admin_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
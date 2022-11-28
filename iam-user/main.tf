## Module for Creating an IAM User with a given Name and Policy and store its creds on AWS Secrets Manager

locals {
  iam_user_creds = {
    AWS_ACCESS_KEY_ID     = aws_iam_access_key.access_key.id,
    AWS_SECRET_ACCESS_KEY = aws_iam_access_key.access_key.secret
  }
  # OPTIONAL: Gets environment from trimming the workspace name (eg. "at-schoolapi-us-east-1-"). If not desired, just remove this line and the variable.
  environment = trimprefix(terraform.workspace, var.workspace_name)
}

resource "aws_iam_user" "iam_user" {
  name = "${var.iam_user_name}-user"
}

resource "aws_iam_user_policy" "iam_policy" {
  name   = var.iam_user_name
  user   = aws_iam_user.iam_user.name
  policy = var.iam_policy
}

resource "aws_iam_access_key" "access_key" {
  user = aws_iam_user.iam_user.name
}

resource "aws_secretsmanager_secret" "iam_creds" {
  name = "/${var.iam_user_name}-${local.environment}/iam-credentials"
}

resource "aws_secretsmanager_secret_version" "iam_creds" {
  secret_id     = aws_secretsmanager_secret.iam_creds.id
  secret_string = jsonencode(local.iam_user_creds)
}

output "iam_creds_path" {
  value = "IAM Creds for ${aws_iam_user.iam_user.name} are available at AWS Secrets Manager path ${aws_secretsmanager_secret.iam_creds.name}"
}

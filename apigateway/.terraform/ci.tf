resource "aws_iam_user" "apigateway_ci" {
  count = local.github == true ? 1 : 0
  name  = "cqt-apigateway-deploy-${var.app_env}"

  tags = merge({
    app = "github-actions"
  }, local.tags)

}

resource "aws_iam_access_key" "apigateway_ci" {
  count = local.github == true ? 1 : 0
  user  = aws_iam_user.apigateway_ci.name
}

resource "aws_iam_user_policy" "apigateway_ci" {
  count = local.github == true ? 1 : 0
  name  = "cqt-apigateway_ci_policy_${var.app_env}"
  user  = aws_iam_user.apigateway_ci.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VisualEditor0",
      "Effect": "Allow",
      "Action": "apigateway:*"
      "Resource": "*"
    }
  ]
}
EOF
}
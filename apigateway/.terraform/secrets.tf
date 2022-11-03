#####  SECRETS

resource "aws_secretsmanager_secret" "apigateway_ci" {
  name = "/global/github-ci/cqt-apigateway-deploy"
}

resource "aws_secretsmanager_secret_version" "apigateway_ci" {
  secret_id     = aws_secretsmanager_secret.apigateway_ci.id
  secret_string = <<EOF
   {
    "AWS_ACCESS_KEY_ID": "${aws_iam_access_key.apigateway_ci.id}",
    "AWS_SECRET_ACCESS_KEY": "${aws_iam_access_key.apigateway_ci.secret}"
   }
EOF

  depends_on = [aws_iam_access_key.apigateway_ci]
}
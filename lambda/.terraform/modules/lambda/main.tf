resource "aws_lambda_function" "lambda_function" {
  function_name = var.name
  role          = var.iam_for_lambda
  image_uri     = format("%s:latest", "${var.image_uri}")
  package_type  = "Image"
  memory_size   = var.lambda_memory
  timeout       = var.lambda_timeout


  dynamic "environment" {
    for_each = var.env
    content {
      variables = {
        bucket_name = environment.value.bucket_name
        user_hash = environment.value.user_hash
        owner_hash = environment.value.owner_hash
      }
    }
  }

  vpc_config {
    security_group_ids = [aws_security_group.this.id]
    subnet_ids         = ["${element(var.subnet_ids, 0)}"]
  }
  lifecycle {
    ignore_changes = [
      environment,
      image_uri
    ]
  }
}
resource "aws_cloudwatch_log_group" "lambda_cloudwatch" {
  name              = "/aws/lambda/${var.name}"
  retention_in_days = 14
}

resource "aws_security_group" "this" {
  description = var.name
  egress = [
    {
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    },
  ]

  ingress = [
    {
      description      = "HTTPS"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
      cidr_blocks      = ["0.0.0.0/0"]
    }

  ]

  name   = var.name
  tags   = var.tags
  vpc_id = var.vpc_id

  timeouts {}
}
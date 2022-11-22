### LAMBDA


module "lambda" {
  source         = "./module/lambda"
  image_uri      = aws_ecr_repository.this.repository_url
  name           = ""
  iam_for_lambda = ""
  lambda_timeout = 30
  lambda_memory  = 512
  vpc_id         = ""
  subnet_ids     = ""

  env = ""

  tags = ""

}
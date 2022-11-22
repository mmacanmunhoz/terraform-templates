terraform {
  backend "s3" {
    profile                 = ""
    shared_credentials_file = ""
    dynamodb_table          = ""

    bucket = ""
    key    = ""
    region = "us-east-2"
  }
}
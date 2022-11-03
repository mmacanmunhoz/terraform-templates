### IAM ROLE

variable "workspace_iam_roles" {
  default = {
    production = "",
    homolog    = ""
  }
}




### PROVIDER

provider "aws" {
  assume_role {
    role_arn = var.workspace_iam_roles[terraform.workspace]
  }

  region                  = "us-east-2"
}
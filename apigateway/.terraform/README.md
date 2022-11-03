## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.46 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.46 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_apigateway"></a> [apigateway](#module\_apigateway) | ./modules/apigateway | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.apigateway_ci](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_user.apigateway_ci](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.apigateway_ci](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_secretsmanager_secret.apigateway_ci](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.apigateway_ci](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [terraform_remote_state.infra](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_actions"></a> [github\_actions](#input\_github\_actions) | n/a | `bool` | `false` | no |
| <a name="input_workspace_iam_roles"></a> [workspace\_iam\_roles](#input\_workspace\_iam\_roles) | n/a | `map` | <pre>{<br>  "homolog": "",<br>  "production": ""<br>}</pre> | no |

## Outputs

No outputs.

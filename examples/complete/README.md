# Complete Example

This is complete usage example of `snowflake-user` terraform module.

## Usage
Populate `.env` file with Snowflake credentials and make sure it's sourced to your shell.

## How to plan

```shell
terraform init
terraform plan -var-file=fixtures.tfvars
```

## How to apply

```shell
terraform init
terraform apply -var-file=fixtures.tfvars
```

## How to destroy

```shell
terraform destroy -var-file=fixtures.tfvars
```


<!-- BEGIN_TF_DOCS -->




## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_context_templates"></a> [context\_templates](#input\_context\_templates) | A map of context templates to use for generating user names | `map(string)` | n/a | yes |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_terraform_snowflake_legacy_service_user"></a> [terraform\_snowflake\_legacy\_service\_user](#module\_terraform\_snowflake\_legacy\_service\_user) | ../../ | n/a |
| <a name="module_terraform_snowflake_service_user"></a> [terraform\_snowflake\_service\_user](#module\_terraform\_snowflake\_service\_user) | ../../ | n/a |
| <a name="module_terraform_snowflake_user_1"></a> [terraform\_snowflake\_user\_1](#module\_terraform\_snowflake\_user\_1) | ../../ | n/a |
| <a name="module_terraform_snowflake_user_2"></a> [terraform\_snowflake\_user\_2](#module\_terraform\_snowflake\_user\_2) | ../../ | n/a |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_legacy_service_user"></a> [legacy\_service\_user](#output\_legacy\_service\_user) | value of the legacy\_service\_user output |
| <a name="output_service_user"></a> [service\_user](#output\_service\_user) | All user module outputs |
| <a name="output_user_1"></a> [user\_1](#output\_user\_1) | All user module outputs |
| <a name="output_user_2"></a> [user\_2](#output\_user\_2) | All user module outputs |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_snowflake"></a> [snowflake](#provider\_snowflake) | >= 0.96 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_context"></a> [context](#requirement\_context) | 0.4.0 |
| <a name="requirement_snowflake"></a> [snowflake](#requirement\_snowflake) | >= 0.96 |

## Resources

| Name | Type |
|------|------|
| [snowflake_account_role.user_role](https://registry.terraform.io/providers/snowflakedb/snowflake/latest/docs/resources/account_role) | resource |
<!-- END_TF_DOCS -->

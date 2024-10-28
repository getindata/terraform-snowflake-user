# Simple example

This is simple usage example of `snowflake-user` terraform module.

## Usage
Populate `.env` file with Snowflake credentials and make sure it's sourced to your shell.

## How to plan

```shell
terraform init
terraform plan
```

## How to apply

```shell
terraform init
terraform apply
```

## How to destroy

```shell
terraform destroy
```

<!-- BEGIN_TF_DOCS -->




## Inputs

No inputs.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_terraform_snowflake_user"></a> [terraform\_snowflake\_user](#module\_terraform\_snowflake\_user) | ../../ | n/a |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_role"></a> [default\_role](#output\_default\_role) | Specifies the role that is active by default for the user's session upon login |
| <a name="output_display_name"></a> [display\_name](#output\_display\_name) | Specifies the namespace (database only or database and schema) that is active by default for the user's session upon login |
| <a name="output_login_name"></a> [login\_name](#output\_login\_name) | The name users use to log in |

## Providers

No providers.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_context"></a> [context](#requirement\_context) | >=0.4.0 |
| <a name="requirement_snowflake"></a> [snowflake](#requirement\_snowflake) | ~> 0.96 |

## Resources

No resources.
<!-- END_TF_DOCS -->

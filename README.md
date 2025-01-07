# Snowflake User Terraform Module

![Snowflake](https://img.shields.io/badge/-SNOWFLAKE-249edc?style=for-the-badge&logo=snowflake&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)

![License](https://badgen.net/github/license/getindata/terraform-snowflake-user)
![Release](https://badgen.net/github/release/getindata/terraform-snowflake-user)

<p align="center">
  <img height="150" src="https://getindata.com/img/logo.svg">
  <h3 align="center">We help companies turn their data into assets</h3>
</p>

Terraform module for creating Snowflake user.

This module can:

- Create and manage Snowflake Users
- Automatically generate RSA private and public keys for the User
- Automatically grant `default_role` and `default_secondary_roles` to the User

## Usage

```terraform
module "terraform_snowflake_user" {
  source = "getindata/terraform-snowflake/user"
  name = "snowflake-user"
}
```

## EXAMPLES

- [Simple](examples/simple) - Basic usage of the module
- [Complete](examples/complete) - Advanced usage of the module

## Breaking changes in v2.x of the module

Due to breaking changes in Snowflake provider and additional code optimizations, **breaking changes** were introduced in `v2.0.0` version of this module.

List of code and variable (API) changes:

- Support for Snowflake user types, managed by `type` variable
- Clear differentiation of `PERSON`, `SERVICE` and `LEGACY_SERVICE` users
- `snowflake_default_secondary_roles` changed to `snowflake_default_secondary_roles_option` (string)
- Added `middle_name`, `query_tag`, `timezone`, `network_policy`, `trace_level`, `log_level` and `enable_unredacted_query_syntax_error` variables
- Added `disable_mfa` flag (`false` by default), that handles MFA enforcement for `PERSON` users

When upgrading from `v1.x`, expect most of the resources to be recreated - if recreation is impossible, then it is possible to import some existing resources.

For more information, refer to [variables.tf](variables.tf), list of inputs below and Snowflake provider documentation

## Breaking changes in v3.x of the module

Due to replacement of nulllabel (`context.tf`) with context provider, some **breaking changes** were introduced in `v3.0.0` version of this module.

List od code and variable (API) changes:

- Removed `context.tf` file (a single-file module with additonal variables), which implied a removal of all its variables (except `name`):
  - `descriptor_formats`
  - `label_value_case`
  - `label_key_case`
  - `id_length_limit`
  - `regex_replace_chars`
  - `label_order`
  - `additional_tag_map`
  - `tags`
  - `labels_as_tags`
  - `attributes`
  - `delimiter`
  - `stage`
  - `environment`
  - `tenant`
  - `namespace`
  - `enabled`
  - `context`
- Remove support `enabled` flag - that might cause some backward compatibility issues with terraform state (please take into account that proper `move` clauses were added to minimize the impact), but proceed with caution
- Additional `context` provider configuration
- New variables were added, to allow naming configuration via `context` provider:
  - `context_templates`
  - `name_schema`

<!-- BEGIN_TF_DOCS -->




## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_comment"></a> [comment](#input\_comment) | Comment / description of Snowflake user | `string` | `null` | no |
| <a name="input_context_templates"></a> [context\_templates](#input\_context\_templates) | Map of context templates used for naming conventions - this variable supersedes `naming_scheme.properties` and `naming_scheme.delimiter` configuration | `map(string)` | `{}` | no |
| <a name="input_default_namespace"></a> [default\_namespace](#input\_default\_namespace) | Specifies the namespace (database only or database and schema) that is active by default for the user's session upon login. | `string` | `null` | no |
| <a name="input_default_role"></a> [default\_role](#input\_default\_role) | Specifies the role that is active by default for the user's session upon login. | `string` | `null` | no |
| <a name="input_default_secondary_roles_option"></a> [default\_secondary\_roles\_option](#input\_default\_secondary\_roles\_option) | Specifies the secondary roles that are active for the user’s session upon login. <br/>    Valid values are (case-insensitive): DEFAULT \| NONE \| ALL | `string` | `"DEFAULT"` | no |
| <a name="input_default_warehouse"></a> [default\_warehouse](#input\_default\_warehouse) | Specifies the virtual warehouse that is active by default for the user's session upon login. | `string` | `null` | no |
| <a name="input_disable_mfa"></a> [disable\_mfa](#input\_disable\_mfa) | Disable Multi-Factor Authentication for the user (works only with `type = PERSON`) | `bool` | `false` | no |
| <a name="input_disabled"></a> [disabled](#input\_disabled) | Specifies whether the user is disabled, which prevents logging in and aborts all the currently-running queries for the user. | `bool` | `false` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Name displayed for the user in the Snowflake web interface. | `string` | `null` | no |
| <a name="input_email"></a> [email](#input\_email) | Email address for the user | `string` | `null` | no |
| <a name="input_enable_unredacted_query_syntax_error"></a> [enable\_unredacted\_query\_syntax\_error](#input\_enable\_unredacted\_query\_syntax\_error) | Controls whether query text is redacted if a SQL query fails due to a syntax or parsing error. If FALSE, the content of a failed query is redacted in the views, pages, and functions that provide a query history. <br/>    Only users with a role that is granted or inherits the AUDIT privilege can set the ENABLE\_UNREDACTED\_QUERY\_SYNTAX\_ERROR parameter. <br/>    When using the ALTER USER command to set the parameter to TRUE for a particular user, modify the user that you want to see the query text, not the user who executed the query (if those are different users). | `bool` | `null` | no |
| <a name="input_first_name"></a> [first\_name](#input\_first\_name) | First name of the user (works only with `type = PERSON`) | `string` | `null` | no |
| <a name="input_generate_password"></a> [generate\_password](#input\_generate\_password) | Generate a random password using Terraform | `bool` | `false` | no |
| <a name="input_generate_rsa_key"></a> [generate\_rsa\_key](#input\_generate\_rsa\_key) | Whether automatically generate an RSA key - IMPORTANT <br/>    The private key generated by this resource will be stored <br/>    unencrypted in your Terraform state file. <br/>    Use of this resource for production deployments is not recommended. | `bool` | `false` | no |
| <a name="input_grant_default_roles"></a> [grant\_default\_roles](#input\_grant\_default\_roles) | Whether to grant default\_role to Snowflake User | `bool` | `true` | no |
| <a name="input_ignore_changes_on_defaults"></a> [ignore\_changes\_on\_defaults](#input\_ignore\_changes\_on\_defaults) | Whether to ignore configuration of `default_warehouse`, `default_role` and `default_namespace` (works only with `type = PERSON`) | `bool` | `false` | no |
| <a name="input_last_name"></a> [last\_name](#input\_last\_name) | Last name of the user (works only with `type = PERSON`) | `string` | `null` | no |
| <a name="input_log_level"></a> [log\_level](#input\_log\_level) | Specifies the severity level of messages that should be ingested and made available in the active event table. Messages at the specified level (and at more severe levels) are ingested. | `string` | `null` | no |
| <a name="input_login_name"></a> [login\_name](#input\_login\_name) | The name users use to log in. If not supplied, snowflake will use name instead. | `string` | `null` | no |
| <a name="input_middle_name"></a> [middle\_name](#input\_middle\_name) | Middle name of the user (works only with `type = PERSON`) | `string` | `null` | no |
| <a name="input_must_change_password"></a> [must\_change\_password](#input\_must\_change\_password) | Should the user change the password on login. Should be set to true for non service account users | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the resource | `string` | n/a | yes |
| <a name="input_name_scheme"></a> [name\_scheme](#input\_name\_scheme) | Naming scheme configuration for the resource. This configuration is used to generate names using context provider:<br/>    - `properties` - list of properties to use when creating the name - is superseded by `var.context_templates`<br/>    - `delimiter` - delimited used to create the name from `properties` - is superseded by `var.context_templates`<br/>    - `context_template_name` - name of the context template used to create the name<br/>    - `replace_chars_regex` - regex to use for replacing characters in property-values created by the provider - any characters that match the regex will be removed from the name<br/>    - `extra_values` - map of extra label-value pairs, used to create a name<br/>    - `uppercase` - convert name to uppercase | <pre>object({<br/>    properties            = optional(list(string), ["environment", "name"])<br/>    delimiter             = optional(string, "_")<br/>    context_template_name = optional(string, "snowflake-user")<br/>    replace_chars_regex   = optional(string, "[^a-zA-Z0-9_]")<br/>    extra_values          = optional(map(string))<br/>    uppercase             = optional(bool, true)<br/>  })</pre> | `{}` | no |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | Specifies the network policy to enforce for your account. Network policies enable restricting access to your account based on users’ IP address. | `string` | `null` | no |
| <a name="input_query_tag"></a> [query\_tag](#input\_query\_tag) | Optional string that can be used to tag queries and other SQL statements executed within a session. | `string` | `null` | no |
| <a name="input_rsa_public_key"></a> [rsa\_public\_key](#input\_rsa\_public\_key) | Specifies the user's RSA public key; used for key-pair authentication. Must be on 1 line without header and trailer. | `string` | `null` | no |
| <a name="input_rsa_public_key_2"></a> [rsa\_public\_key\_2](#input\_rsa\_public\_key\_2) | Specifies the user's second RSA public key; used to rotate the public and private keys <br/>    for key-pair authentication based on an expiration schedule set by your organization. <br/>    Must be on 1 line without header and trailer." | `string` | `null` | no |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | Specifies the time zone for the session. You can specify a time zone name or a link name from release 2021a of the IANA Time Zone Database (e.g. America/Los\_Angeles, Europe/London, UTC, Etc/GMT, etc.). | `string` | `null` | no |
| <a name="input_trace_level"></a> [trace\_level](#input\_trace\_level) | Controls how trace events are ingested into the event table. | `string` | `null` | no |
| <a name="input_type"></a> [type](#input\_type) | Type of the user. Valid values are PERSON, SERVICE, LEGACY\_SERVICE | `string` | `"PERSON"` | no |

## Modules

No modules.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_namespace"></a> [default\_namespace](#output\_default\_namespace) | Specifies the namespace (database only or database and schema) that is active by default for the user's session upon login |
| <a name="output_default_role"></a> [default\_role](#output\_default\_role) | Specifies the role that is active by default for the user's session upon login |
| <a name="output_default_secondary_roles_option"></a> [default\_secondary\_roles\_option](#output\_default\_secondary\_roles\_option) | Specifies the secondary roles that are active for the user’s session upon login |
| <a name="output_default_warehouse"></a> [default\_warehouse](#output\_default\_warehouse) | Specifies the virtual warehouse that is active by default for the user's session upon login |
| <a name="output_disable_mfa"></a> [disable\_mfa](#output\_disable\_mfa) | Whether multi-factor authentication is disabled for the user |
| <a name="output_disabled"></a> [disabled](#output\_disabled) | Whether user account is disabled |
| <a name="output_display_name"></a> [display\_name](#output\_display\_name) | Name displayed for the user in the Snowflake web interface |
| <a name="output_email"></a> [email](#output\_email) | Email address for the user |
| <a name="output_enable_unredacted_query_syntax_error"></a> [enable\_unredacted\_query\_syntax\_error](#output\_enable\_unredacted\_query\_syntax\_error) | Enable access to unredacted query syntax error for the user |
| <a name="output_first_name"></a> [first\_name](#output\_first\_name) | First name of the user (only if `type == PERSON`) |
| <a name="output_last_name"></a> [last\_name](#output\_last\_name) | Last name of the user (only if `type == PERSON`) |
| <a name="output_log_level"></a> [log\_level](#output\_log\_level) | Log level |
| <a name="output_login_name"></a> [login\_name](#output\_login\_name) | The name users use to log in |
| <a name="output_middle_name"></a> [middle\_name](#output\_middle\_name) | Middle name of the user (only if `type == PERSON`) |
| <a name="output_name"></a> [name](#output\_name) | Name of the user |
| <a name="output_network_policy"></a> [network\_policy](#output\_network\_policy) | Network policy associated with the user |
| <a name="output_password"></a> [password](#output\_password) | Password set for the user (only if `type == PERSON` or `type == LEGACY_SERVICE`) |
| <a name="output_query_tag"></a> [query\_tag](#output\_query\_tag) | Query tag |
| <a name="output_rsa_private_key"></a> [rsa\_private\_key](#output\_rsa\_private\_key) | RSA Private key used for authentication |
| <a name="output_timezone"></a> [timezone](#output\_timezone) | Timezone |
| <a name="output_trace_level"></a> [trace\_level](#output\_trace\_level) | Trace level |
| <a name="output_type"></a> [type](#output\_type) | User type |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_context"></a> [context](#provider\_context) | >=0.4.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.0.0 |
| <a name="provider_snowflake"></a> [snowflake](#provider\_snowflake) | >= 0.96 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | ~> 4.0 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_context"></a> [context](#requirement\_context) | >=0.4.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0.0 |
| <a name="requirement_snowflake"></a> [snowflake](#requirement\_snowflake) | >= 0.96 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [snowflake_grant_account_role.default_role](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/grant_account_role) | resource |
| [snowflake_legacy_service_user.this](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/legacy_service_user) | resource |
| [snowflake_service_user.this](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/service_user) | resource |
| [snowflake_user.defaults_not_enforced](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/user) | resource |
| [snowflake_user.this](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/user) | resource |
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [context_label.this](https://registry.terraform.io/providers/cloudposse/context/latest/docs/data-sources/label) | data source |
<!-- END_TF_DOCS -->
## CONTRIBUTING

Contributions are very welcomed!

Start by reviewing [contribution guide](CONTRIBUTING.md) and our [code of conduct](CODE_OF_CONDUCT.md). After that, start coding and ship your changes by creating a new PR.

## LICENSE

Apache 2 Licensed. See [LICENSE](LICENSE) for full details.

## AUTHORS

<!--- Replace repository name -->
<a href="https://github.com/getindata/terraform-snowflake-user/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=getindata/terraform-snowflake-user" />
</a>

Made with [contrib.rocks](https://contrib.rocks).

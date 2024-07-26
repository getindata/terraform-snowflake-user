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

* Create and manage Snowflake Users
* Automatically generate RSA private and public keys for the User
* Automatically grant `default_role` and `default_secondary_roles` to the User

## Usage

```terraform
module "terraform_snowflake_user" {
  source = "getindata/terraform-snowflake/user"
  name = "snowflake-user"
}
```

---

<!-- BEGIN_TF_DOCS -->




## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional key-value pairs to add to each map in `tags_as_list_of_maps`. Not added to `tags` or `id`.<br>This is for some rare cases where resources want additional configuration of tags<br>and therefore take a list of maps with tag key, value, and additional configuration. | `map(string)` | `{}` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | ID element. Additional attributes (e.g. `workers` or `cluster`) to add to `id`,<br>in the order they appear in the list. New attributes are appended to the<br>end of the list. The elements of the list are joined by the `delimiter`<br>and treated as a single ID element. | `list(string)` | `[]` | no |
| <a name="input_comment"></a> [comment](#input\_comment) | Comment / description of Snowflake user | `string` | `null` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "descriptor_formats": {},<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "labels_as_tags": [<br>    "unset"<br>  ],<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {},<br>  "tenant": null<br>}</pre> | no |
| <a name="input_default_namespace"></a> [default\_namespace](#input\_default\_namespace) | Specifies the namespace (database only or database and schema) that is active by default for the user's session upon login. | `string` | `null` | no |
| <a name="input_default_role"></a> [default\_role](#input\_default\_role) | Specifies the role that is active by default for the user's session upon login. | `string` | `null` | no |
| <a name="input_default_secondary_roles"></a> [default\_secondary\_roles](#input\_default\_secondary\_roles) | Specifies the set of secondary roles that are active for the user's session upon login. <br>    Secondary roles are a set of roles that authorize any SQL action other than the execution of CREATE <object> statements. <br>    Currently only ["ALL"] value is supported | `list(string)` | `[]` | no |
| <a name="input_default_warehouse"></a> [default\_warehouse](#input\_default\_warehouse) | Specifies the virtual warehouse that is active by default for the user's session upon login. | `string` | `null` | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between ID elements.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_descriptor_formats"></a> [descriptor\_formats](#input\_descriptor\_formats) | Describe additional descriptors to be output in the `descriptors` output map.<br>Map of maps. Keys are names of descriptors. Values are maps of the form<br>`{<br>   format = string<br>   labels = list(string)<br>}`<br>(Type is `any` so the map values can later be enhanced to provide additional options.)<br>`format` is a Terraform format string to be passed to the `format()` function.<br>`labels` is a list of labels, in order, to pass to `format()` function.<br>Label values will be normalized before being passed to `format()` so they will be<br>identical to how they appear in `id`.<br>Default is `{}` (`descriptors` output will be empty). | `any` | `{}` | no |
| <a name="input_descriptor_name"></a> [descriptor\_name](#input\_descriptor\_name) | Name of the descriptor used to form a Snowflake User name | `string` | `"snowflake-user"` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Name displayed for the user in the Snowflake web interface. | `string` | `null` | no |
| <a name="input_email"></a> [email](#input\_email) | Email address for the user | `string` | `null` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_first_name"></a> [first\_name](#input\_first\_name) | First name of the user | `string` | `null` | no |
| <a name="input_generate_password"></a> [generate\_password](#input\_generate\_password) | Generate a random password using Terraform | `bool` | `false` | no |
| <a name="input_generate_rsa_key"></a> [generate\_rsa\_key](#input\_generate\_rsa\_key) | Whether automatically generate an RSA key - IMPORTANT <br>    The private key generated by this resource will be stored <br>    unencrypted in your Terraform state file. <br>    Use of this resource for production deployments is not recommended. | `bool` | `false` | no |
| <a name="input_grant_default_roles"></a> [grant\_default\_roles](#input\_grant\_default\_roles) | Whether to grant default\_role to Snowflake User | `bool` | `true` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for keep the existing setting, which defaults to `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_ignore_changes_on_defaults"></a> [ignore\_changes\_on\_defaults](#input\_ignore\_changes\_on\_defaults) | Whether to ignore configuration of `default_warehouse`, `default_role` and `default_namespace` | `bool` | `false` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | Controls the letter case of the `tags` keys (label names) for tags generated by this module.<br>Does not affect keys of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The order in which the labels (ID elements) appear in the `id`.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 6 labels ("tenant" is the 6th), but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | Controls the letter case of ID elements (labels) as included in `id`,<br>set as tag values, and output by this module individually.<br>Does not affect values of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Set this to `title` and set `delimiter` to `""` to yield Pascal Case IDs.<br>Default value: `lower`. | `string` | `null` | no |
| <a name="input_labels_as_tags"></a> [labels\_as\_tags](#input\_labels\_as\_tags) | Set of labels (ID elements) to include as tags in the `tags` output.<br>Default is to include all labels.<br>Tags with empty values will not be included in the `tags` output.<br>Set to `[]` to suppress all generated tags.<br>**Notes:**<br>  The value of the `name` tag, if included, will be the `id`, not the `name`.<br>  Unlike other `null-label` inputs, the initial setting of `labels_as_tags` cannot be<br>  changed in later chained modules. Attempts to change it will be silently ignored. | `set(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_last_name"></a> [last\_name](#input\_last\_name) | Last name of the user | `string` | `null` | no |
| <a name="input_login_name"></a> [login\_name](#input\_login\_name) | The name users use to log in. If not supplied, snowflake will use name instead. | `string` | `null` | no |
| <a name="input_must_change_password"></a> [must\_change\_password](#input\_must\_change\_password) | Should the user change the password on login. Should be set to true for non service account users | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.<br>This is the only ID element not also included as a `tag`.<br>The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input. | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique | `string` | `null` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Terraform regular expression (regex) string.<br>Characters matching the regex will be removed from the ID elements.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_rsa_public_key"></a> [rsa\_public\_key](#input\_rsa\_public\_key) | Specifies the user's RSA public key; used for key-pair authentication. Must be on 1 line without header and trailer. | `string` | `null` | no |
| <a name="input_rsa_public_key_2"></a> [rsa\_public\_key\_2](#input\_rsa\_public\_key\_2) | Specifies the user's second RSA public key; used to rotate the public and private keys <br>    for key-pair authentication based on an expiration schedule set by your organization. <br>    Must be on 1 line without header and trailer." | `string` | `null` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | ID element. Usually used to indicate role, e.g. 'prod', 'staging', 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).<br>Neither the tag keys nor the tag values will be modified by this module. | `map(string)` | `{}` | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | ID element \_(Rarely used, not included by default)\_. A customer identifier, indicating who this instance of a resource is for | `string` | `null` | no |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_this"></a> [this](#module\_this) | cloudposse/label/null | 0.25.0 |
| <a name="module_user_label"></a> [user\_label](#module\_user\_label) | cloudposse/label/null | 0.25.0 |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_namespace"></a> [default\_namespace](#output\_default\_namespace) | Specifies the namespace (database only or database and schema) that is active by default for the user's session upon login |
| <a name="output_default_role"></a> [default\_role](#output\_default\_role) | Specifies the role that is active by default for the user's session upon login |
| <a name="output_default_warehouse"></a> [default\_warehouse](#output\_default\_warehouse) | Specifies the virtual warehouse that is active by default for the user's session upon login |
| <a name="output_disabled"></a> [disabled](#output\_disabled) | Whether user account is disabled |
| <a name="output_display_name"></a> [display\_name](#output\_display\_name) | Name displayed for the user in the Snowflake web interface |
| <a name="output_email"></a> [email](#output\_email) | Email address for the user |
| <a name="output_first_name"></a> [first\_name](#output\_first\_name) | First name of the user |
| <a name="output_last_name"></a> [last\_name](#output\_last\_name) | Last name of the user |
| <a name="output_login_name"></a> [login\_name](#output\_login\_name) | The name users use to log in |
| <a name="output_name"></a> [name](#output\_name) | Name of the user |
| <a name="output_password"></a> [password](#output\_password) | Password set for the user |
| <a name="output_rsa_private_key"></a> [rsa\_private\_key](#output\_rsa\_private\_key) | RSA Private key used for authentication |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.0.0 |
| <a name="provider_snowflake"></a> [snowflake](#provider\_snowflake) | ~> 0.90 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | ~> 4.0 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0.0 |
| <a name="requirement_snowflake"></a> [snowflake](#requirement\_snowflake) | ~> 0.90 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [snowflake_grant_account_role.default_role](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/grant_account_role) | resource |
| [snowflake_user.defaults_not_enforced](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/user) | resource |
| [snowflake_user.this](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/user) | resource |
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
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

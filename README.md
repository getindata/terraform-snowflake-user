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

## Breaking changes in v2.x of the module

Due to breaking changes in Snowflake provider and additional code optimizations, **breaking changes** were introduced in `v2.0.0` version of this module.

List of code and variable (API) changes:

* Support for Snowflake user types, managed by `type` variable
* Clear differentiation of `PERSON`, `SERVICE` and `LEGACY_SERVICE` users
* `snowflake_default_secondary_roles` changed to `snowflake_default_secondary_roles_option` (string)
* Added `middle_name`, `query_tag`, `timezone`, `network_policy`, `trace_level`, `log_level` and `enable_unredacted_query_syntax_error` variables
* Added `disable_mfa` flag (`false` by default), that handles MFA enforcement for `PERSON` users

When upgrading from `v1.x`, expect most of the resources to be recreated - if recreation is impossible, then it is possible to import some existing resources.

For more information, refer to [variables.tf](variables.tf), list of inputs below and Snowflake provider documentation

<!-- BEGIN_TF_DOCS -->




## Inputs

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

resource "snowflake_role" "user_role" {
  name = "SNOWFLAKE_USER_ROLE"
}

module "terraform_snowflake_user_1" {
  source            = "../../"
  name              = "user_1"
  generate_rsa_key  = true
  generate_password = true

  default_role            = resource.snowflake_role.user_role.name
  default_secondary_roles = ["ALL"]
}

module "terraform_snowflake_user_2" {
  source                     = "../../"
  name                       = "USER_2"
  context_template           = "{{.environment}}_{{.name}}"
  context_properties         = null # Has to be null, when `context_template` is used
  generate_rsa_key           = true
  generate_password          = true
  ignore_changes_on_defaults = false
  grant_default_roles        = true

  default_role            = resource.snowflake_role.user_role.name
  default_secondary_roles = ["ALL"]
}


module "terraform_snowflake_user_3" {
  source                     = "../../"
  name                       = "USER_3"
  context_properties         = ["environment", "stage", "name"]
  generate_rsa_key           = true
  generate_password          = true
  ignore_changes_on_defaults = false
  grant_default_roles        = true

  default_role            = resource.snowflake_role.user_role.name
  default_secondary_roles = ["ALL"]
}

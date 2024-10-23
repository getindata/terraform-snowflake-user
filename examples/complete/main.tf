resource "snowflake_account_role" "user_role" {
  name = "SNOWFLAKE_USER_ROLE"
}

module "terraform_snowflake_user_1" {
  source  = "../../"
  context = module.this.context
  name    = "snowflake_user_1"
  comment = "Example Snowflake User"

  generate_rsa_key     = true
  generate_password    = true
  must_change_password = true

  email        = "test@example.com"
  first_name   = "John"
  middle_name  = "Jack"
  last_name    = "Doe"
  display_name = "John Doe"

  query_tag                            = "USER_1"
  timezone                             = "Europe/Warsaw"
  enable_unredacted_query_syntax_error = false
  disable_mfa                          = false

  default_role                   = resource.snowflake_account_role.user_role.name
  default_secondary_roles_option = "ALL"
}

module "terraform_snowflake_user_2" {
  source                     = "../../"
  context                    = module.this.context
  name                       = "snowflake_user_2"
  type                       = "PERSON"
  generate_rsa_key           = true
  generate_password          = true
  must_change_password       = true
  ignore_changes_on_defaults = false
  grant_default_roles        = true

  email        = "user@example.com"
  first_name   = "Jane"
  middle_name  = "Kate"
  last_name    = "Doe"
  display_name = "Jane Doe"

  query_tag                            = "USER_2"
  timezone                             = "Europe/Warsaw"
  enable_unredacted_query_syntax_error = true
  disable_mfa                          = true

  default_role                   = resource.snowflake_account_role.user_role.name
  default_secondary_roles_option = "NONE"
}

module "terraform_snowflake_service_user" {
  source           = "../../"
  context          = module.this.context
  type             = "SERVICE"
  name             = "service_user"
  comment          = "Example Snowflake Service User"
  generate_rsa_key = true


  query_tag   = "SERVICE_USER"
  log_level   = "ERROR"
  trace_level = "ON_EVENT"

  default_secondary_roles_option = "NONE"
}

module "terraform_snowflake_legacy_service_user" {
  source            = "../../"
  context           = module.this.context
  type              = "LEGACY_SERVICE"
  name              = "legacy_service_user"
  generate_password = true

  query_tag = "LEGACY_SERVICE_USER"
}

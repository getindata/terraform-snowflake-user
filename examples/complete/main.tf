resource "snowflake_role" "user_role" {
  name = "SNOWFLAKE_USER_ROLE"
}

resource "snowflake_role" "secondary_role" {
  name = "SNOWFLAKE_SECOND_ROLE"
}

module "terraform_snowflake_user" {
  source            = "../../"
  context           = module.this.context
  name              = "snowflake-user"
  generate_rsa_key  = true
  generate_password = true

  default_role            = resource.snowflake_role.user_role.name
  default_secondary_roles = [resource.snowflake_role.secondary_role.name]
}


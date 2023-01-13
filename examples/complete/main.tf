module "terraform_snowflake_user" {
  source            = "../../"
  context           = module.this.context
  name              = "snowflake-user"
  generate_rsa_key  = true
  generate_password = true
}
